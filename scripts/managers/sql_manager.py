from managers.chroma_db_manager import ChromaDBManager


class SQLSchemaManager(ChromaDBManager):

    def __init__(self):
        super().__init__()
    
    # add schema strings (with optional metadata) into a collection
    def add_schema_to_collection(self, collection_name, schema_docs):
        if collection_name not in self.collections:
            raise ValueError(f"Collection '{collection_name}' not found. Create it first.")

        texts = [doc["text"] for doc in schema_docs]
        metadatas = [{"table": doc["table"], "columns": ", ".join(doc["columns"])} for doc in schema_docs]

        self.collections[collection_name].add_texts(texts=texts, metadatas=metadatas)
        print(f"[+] Added {len(texts)} schema docs to collection '{collection_name}'.")
    
    # print table names 
    def list_tables(self, collection_name):
        collection = self.get_collection(collection_name)
        docs = collection.get(include=["metadatas"])
        return sorted(set(meta["table"] for meta in docs["metadatas"] if "table" in meta))

    # print table names and their attributes 
    def list_table_attributes(self, collection_name):
        collection = self.get_collection(collection_name)
        docs = collection.get(include=["metadatas"])
        return {
            meta["table"]: meta.get("columns", [])
            for meta in docs["metadatas"] if "table" in meta
        }