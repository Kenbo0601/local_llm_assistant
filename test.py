from scripts.rag.retriever import Retriever
from scripts.managers.sql_manager import SQLSchemaManager

# testing RAG retriever
manager = SQLSchemaManager()
collection = manager.get_collection("sakila")

retriever = Retriever(collection)

question = "Find top 3 customers who paid more than 10 dollers."
context_chunks = retriever.retrieve_context(question)

for i, chunk in enumerate(context_chunks, 1):
    print(f"Chunks {i}:\n{chunk}\n")