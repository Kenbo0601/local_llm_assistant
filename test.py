from scripts.rag.retriever import Retriever
from scripts.managers.sql_manager import SQLSchemaManager
from scripts.rag.prompt_builder import PromptBuilder
from scripts.rag.rag_pipeline import Pipeline


# testing RAG retriever
manager = SQLSchemaManager()
#docs = manager.load_schema("sqlite-sakila.db")
#manager.create_collection("sakila")
#manager.add_schema_to_collection("sakila", docs)
collection = manager.get_collection("sakila")

#question = "Find top 3 customers who paid more than 10 dollers."
#question = "Find all actors whose last names contain the letters LI.order the rows by last name and first name, in that order."
#question = "Display the first and last names of all actors from the table actor."
question = "Using IN, display the country_id and country columns of the following countries: Afghanistan, Bangladesh, and China."
pipeline = Pipeline() # we only need to create one pipeline object. when user switches collection, just call update_collection function
pipeline.update_collection(collection)
pipeline.run(question)
