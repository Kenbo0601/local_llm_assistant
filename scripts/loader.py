from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain_community.document_loaders import PyMuPDFLoader
from langchain_community.embeddings import HuggingFaceBgeEmbeddings
from langchain_community.vectorstores import Chroma
import sqlite3
import os 


# Class for processing documents - TODO: we need to embed docs into chroma database 
class DocumentLoader:

    def __init__(self, path="../data/"):
        self.dir_path = path # path to the data directory

    def load_schema(self, db_name):
        db_path = os.path.join(self.dir_path, "db", db_name)
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
            print(schema_text)
            schema_docs.append({
                "text": schema_text,
                "table": table,
                "columns": columns
            })

        conn.close()
        return schema_docs


    # load and process one pdf file TODO: need to add something more, either return the chunks or call chroma_db manager 
    def load_pdf(self, doc_name):
        loader = PyMuPDFLoader(self.dir_path + "pdf/" + doc_name)
        docs = loader.load()
        text_splitter = RecursiveCharacterTextSplitter(chunk_size=500, chunk_overlap=100)
        chunks = text_splitter.split_documents(docs)

        # print contents for testing
        for i, chunk in enumerate(chunks):
            print(f"\n--- Chunk {i+1} ---")
            print(chunk.page_content)
        
        return chunks

    # process all pdf files in data/pdf folder
    def load_all_pdfs(self):
        all_chunks = [] # store chunks of all pdfs 
        return all_chunks

