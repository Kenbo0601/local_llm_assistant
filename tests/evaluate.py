import json 
from scripts.rag.rag_pipeline import Pipeline
from scripts.managers.sql_manager import SQLSchemaManager
import sqlite3
from pathlib import Path
import re

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

#TODO: we can use spider evaluation.py for evaluating llm generated queries 
# in spider, there is a dev_gold.sql file which has ground-truth queries. 
# so we generate the same file format with db_id and llm generated query - name it dev_pred.sql 
# then we can run evaluation.py in spider 
def evaluate():

    manager = SQLSchemaManager()
    pipeline = Pipeline()
    pipeline.change_model("qwen2.5-coder:7b") # change model for testing 
    destination = Path(__file__).resolve().parent.parent / "data" / "testdata"

    for i in toy_data:

        db = i["db_id"] + ".sqlite"
        query = i["query"]
        question = i["question"]

        collection = manager.get_collection(db) # retrieve collection from chroma db
        pipeline.update_collection(collection)
        response = pipeline.run(question) # llm generated response 
        llm_sql = re.sub(r"```sql\s*|```", "", response).strip()
        print(llm_sql)

        #TODO: query results from corresponding db using query and response to see if the results are the same 
        try:
            conn = sqlite3.connect(str(destination) + "/" + db)
            cursor = conn.cursor()
            cursor.execute(llm_sql)
            rows = cursor.fetchall()
            for row in rows:
                print(row)
            conn.close()
        except Exception as e:
            print(f"  Error connecting to {db}: {e}")
    
    return 


if __name__ == "__main__":
    evaluate()