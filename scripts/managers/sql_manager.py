# this from .. path is from the top level directory, so if you test something quick, you should make a test.py at the top directory 
# so that we dont have to change scripts.managers... to managers. etc
from scripts.managers.chroma_db_manager import ChromaDBManager
import sqlite3

class SQLSchemaManager(ChromaDBManager):

    def __init__(self):
        super().__init__()
        self.data_path = self.base_path / "data" / "db"
    
    def load_schema(self, db_name):
        db_path = self.data_path / db_name
        try:
            conn = sqlite3.connect(db_path)
            print(f"[+] Connected to {db_name}")
        except sqlite3.OperationalError:
            print(f"[!] Error: Could not connect to DB at {db_path}")
            return []

        cursor = conn.cursor()
        cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
        tables = [t[0] for t in cursor.fetchall()]

        schema_docs = []

        for table in tables:
            cursor.execute(f"PRAGMA table_info({table})")
            rows = cursor.fetchall()
            columns = [f"{r[1]} (PK)" if r[5] else r[1] for r in rows]
            schema_text = f"Table: {table}\nColumns: {', '.join(columns)}"
            schema_docs.append({
                "text": schema_text,
                "table": table,
                "columns": columns
            })

        conn.close()
        return schema_docs
    
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
