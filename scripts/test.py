from loader import DocumentLoader
from chroma_db_manager import ChromaDBManager

doc_loader = DocumentLoader()
doc_loader.load_schema("sqlite-sakila.db")

'''
doc_loader = DocumentLoader()
chunks = doc_loader.load_pdf("paper1.pdf")

# Create Chroma DB + Collection
chroma = ChromaDBManager()
chroma.create_collection("pdf_chunks")

# Add the first chunk only (or all if you prefer)
chroma.add_documents_to_collection("pdf_chunks", [chunks[0]])'''

# testing - above code added pdf chunks into chroma database, so after running the code above, checking if it exists in db and pull data
#chroma = ChromaDBManager()
#c = chroma.get_collection("pdf_chunks")
#print(c)