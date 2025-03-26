from loader import DocumentLoader
from managers.sql_manager import SQLSchemaManager

doc_loader = DocumentLoader()
schema_docs = doc_loader.load_schema("sqlite-sakila.db")

manager = SQLSchemaManager()
manager.create_collection("sakila")
manager.add_schema_to_collection("sakila", schema_docs)

print(manager.list_tables('sakila'))

attrs = manager.list_table_attributes("sakila")
for table, cols in attrs.items():
    print(f"{table}: {cols}")



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