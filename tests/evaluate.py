import json 
from scripts.rag.rag_pipeline import Pipeline
from scripts.managers.sql_manager import SQLSchemaManager
import sqlite3

# Read in filtered_spider.json 
# use pipeline to query the same question from the same database for each block in the json file (db_id, query, question)
# once we get the result, run both queries(one from json file, and one our program generates) 
# this can be done by connecting to data/testdata
# evaluate the query results - if they got the same results 
# we can count correctness / total number of runs (number of blocks in json)

toy_data = [
    {
        "db_id": "department_management",
        "query": "SELECT count(*) FROM head WHERE age  >  56",
        "question": "How many heads of the departments are older than 56 ?"
    },
    {
        "db_id": "farm",
        "query": "SELECT Total_Horses FROM farm ORDER BY Total_Horses ASC",
        "question": "What is the total horses record for each farm, sorted ascending?"
    }
]

def evaluate():

    manager = SQLSchemaManager()
    pipeline = Pipeline()
    pipeline.change_model("qwen2.5-coder:7b") # change model for testing 

    for i in toy_data:

        db = i["db_id"] + ".sqlite"
        query = i["query"]
        question = i["question"]

        collection = manager.get_collection(db) # retrieve collection from chroma db
        pipeline.update_collection(collection)
        response = pipeline.run(question) # llm generated response 

        #TODO: query results from corresponding db using query and response to see if the results are the same 
    return 


if __name__ == "__main__":
    evaluate()