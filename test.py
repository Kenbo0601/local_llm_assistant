from scripts.rag.retriever import Retriever
from scripts.managers.sql_manager import SQLSchemaManager
from scripts.rag.prompt_builder import PromptBuilder
from scripts.rag.rag_pipeline import Pipeline


# testing RAG retriever
manager = SQLSchemaManager()
data = manager.get_all_collections()
for i in data:
    print(i)
#docs = manager.load_schema("sqlite-sakila.db")
#manager.create_collection("sakila")
#manager.add_schema_to_collection("sakila", docs)
#collection = manager.get_collection("sakila")
