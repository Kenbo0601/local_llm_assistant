from scripts.rag.retriever import Retriever
from scripts.managers.sql_manager import SQLSchemaManager


# testing RAG retriever
manager = SQLSchemaManager()
#docs = manager.load_schema("sqlite-sakila.db")
#manager.create_collection("sakila")
#manager.add_schema_to_collection("sakila", docs)
collection = manager.get_collection("sakila")

retriever = Retriever(collection)

#question = "Find top 3 customers who paid more than 10 dollers."
question = "Display the first and last names of all actors from the table actor."
context_chunks = retriever.retrieve_context(question)

for i, chunk in enumerate(context_chunks, 1):
    print(f"Chunks {i}:\n{chunk}\n")