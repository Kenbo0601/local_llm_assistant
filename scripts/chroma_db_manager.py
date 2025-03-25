from langchain_community.vectorstores import Chroma
from langchain_community.embeddings import HuggingFaceEmbeddings

# Manages chroma database 
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
            
    # add documents into existing collection - need to specify collection name 
    def add_documents_to_collection(self, collection_name, documents):
        if collection_name not in self.collections:
            raise ValueError(f"Collection '{collection_name}' not found. Create it first.")
        self.collections[collection_name].add_documents(documents)
        print(f"[+] Added {len(documents)} chunks to collection '{collection_name}'.")
