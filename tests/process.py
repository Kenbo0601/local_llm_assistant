from scripts.managers.sql_manager import SQLSchemaManager
import json 

'''
- Extract database id, query, and question from train_spider.json which contains 7000+ set of query and questions
To run this script from the project root: python3 -m tests.process
'''

def parser():
    path = "train_spider.json"
    with open(path, "r") as f:
        data = json.load(f)

    # Extract db_id, query, and question
    extracted_data = [{"db_id": item["db_id"], "query": item["query"], "question": item["question"]} for item in data]

    for i in extracted_data:
        print(i)

# add test database into data/testdata folder
def add_db():
    return 

if __name__ == "__main__":

    # 1: place database folder from spider in this tests dir
    # 2: add .sqlite files into data/testdata 
    # 3: use sql manager to add these database files into chroma database 

    manager = SQLSchemaManager("testdata") # create a test folder in data before creating manager object