from langchain_community.vectorstores import Chroma
from langchain_community.embeddings import HuggingFaceEmbeddings

# TODO: we probably should have one collection for one .db file instead of storing whole .db files in one collection 

# Base Manager Class
class ChromaDBManager:
    def __init__(self, path="../chroma_db"):
        self.db_path = path
        self.embedding_function = HuggingFaceEmbeddings(model_name="all-MiniLM-L6-v2") # sentence transformer model - this model is small and fast
        self.collections = {}

    # Create collection in chroma database with collection name - ex: pdf_chunks
    def create_collection(self,collection_name):
        db = Chroma(
            collection_name=collection_name,
            embedding_function=self.embedding_function,
            persist_directory=self.db_path
        )
        self.collections[collection_name] = db
        print(f"[+] Added collection '{collection_name}' into chroma_db.")
        return db

    # pull data with collection name from chroma database
    def get_collection(self,collection_name):
        if collection_name in self.collections:
            return self.collections.get(collection_name)
        else:
            # Load it from disk using LangChain's Chroma wrapper
            db = Chroma(
                collection_name=collection_name,
                embedding_function=self.embedding_function,
                persist_directory=self.db_path
            )
            self.collections[collection_name] = db
            print(f"[+] Loaded collection '{collection_name}' from disk.")
            return db


# Child Class - Handle SQL tasks
class SQLSchemaManager(ChromaDBManager):

    def __init__(self, chroma_path="../chroma_db"):
        super().__init__(path=chroma_path)
    
    # add schema strings (with optional metadata) into a collection
    def add_schema_to_collection(self, collection_name, schema_docs):
        if collection_name not in self.collections:
            raise ValueError(f"Collection '{collection_name}' not found. Create it first.")

        texts = [doc["text"] for doc in schema_docs]
        metadatas = [{"table": doc["table"], "columns": ", ".join(doc["columns"])} for doc in schema_docs]

        self.collections[collection_name].add_texts(texts=texts, metadatas=metadatas)
        print(f"[+] Added {len(texts)} schema docs to collection '{collection_name}'.")
 
    def list_tables(self, collection_name):
        collection = self.get_collection(collection_name)
        docs = collection.get(include=["metadatas"])
        return sorted(set(meta["table"] for meta in docs["metadatas"] if "table" in meta))
    
    def list_table_attributes(self, collection_name):
        collection = self.get_collection(collection_name)
        docs = collection.get(include=["metadatas"])
        return {
            meta["table"]: meta.get("columns", [])
            for meta in docs["metadatas"] if "table" in meta
        }


# Child Class - Handle PDF documents
class PDFManager(ChromaDBManager):

    def __init__(self, chroma_path="../chroma_db"):
        super().__init__(path=chroma_path)
    
    # add documents into existing collection - need to specify collection name 
    def add_documents_to_collection(self, collection_name, documents):
        if collection_name not in self.collections:
            raise ValueError(f"Collection '{collection_name}' not found. Create it first.")
        self.collections[collection_name].add_documents(documents)
        print(f"[+] Added {len(documents)} chunks to collection '{collection_name}'.")
