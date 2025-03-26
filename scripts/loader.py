from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain_community.document_loaders import PyMuPDFLoader
from langchain_community.embeddings import HuggingFaceBgeEmbeddings
from langchain_community.vectorstores import Chroma
import sqlite3
import os 

#embedding = HuggingFaceBgeEmbeddings(model_name="all-MiniLM-L6-v2")

# testing db connection
'''
db_path = os.path.join(os.path.dirname(__file__), "..", "data", "sqlite-sakila.db")
conn = sqlite3.connect(db_path)
cursor = conn.cursor()
cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
tables = cursor.fetchall()
print("Tables:", tables)'''

# Class for processing documents - TODO: we need to embed docs into chroma database 
class DocumentLoader:

    def __init__(self, path="../data/"):
        self.dir_path = path # path to the data directory

    #  extract db file - get table names and attributes 
    def load_schema(self, db_name):
        db_path = self.dir_path + "db/" + db_name
        try:
            conn = sqlite3.connect(db_path)
            print("Connection successful.")
        except FileNotFoundError:
            print("Error: File not found.")

        cursor = conn.cursor() 
        cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
        tables = [t[0] for t in cursor.fetchall()]

        schema_docs = []

        # loop through each table to get attributes
        for table in tables:
            cursor.execute(f"PRAGMA table_info({table})")
            columns = [row[1] for row in cursor.fetchall()]
            schema_text = f"Table: {table}\nColumns: {', '.join(columns)}"
            print(schema_text)
            schema_docs.append(schema_text) # save them into the list

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

