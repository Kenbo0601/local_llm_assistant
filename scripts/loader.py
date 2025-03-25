# Load and chnk documents 
import sqlite3
import os 
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain_community.document_loaders import PyMuPDFLoader
from langchain_community.embeddings import HuggingFaceBgeEmbeddings
from langchain_community.vectorstores import Chroma


loader = PyMuPDFLoader("../data/paper1.pdf")
docs = loader.load()

text_splitter = RecursiveCharacterTextSplitter(chunk_size=500, chunk_overlap=100)
chunks = text_splitter.split_documents(docs)

for i, chunk in enumerate(chunks):
    print(f"\n--- Chunk {i+1} ---")
    print(chunk.page_content)

embedding = HuggingFaceBgeEmbeddings(model_name="all-MiniLM-L6-v2")

# testing db connection
'''
db_path = os.path.join(os.path.dirname(__file__), "..", "data", "sqlite-sakila.db")
conn = sqlite3.connect(db_path)
cursor = conn.cursor()
cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
tables = cursor.fetchall()
print("Tables:", tables)'''


class DocumentLoader:
    pass
