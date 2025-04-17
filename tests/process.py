from scripts.managers.sql_manager import SQLSchemaManager
import json 
from pathlib import Path
import sqlite3
import shutil

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

# add test database into data/testdata folder and chroma database
def add_db():
    # Since database is in the same folder as this script
    root_dir = Path(__file__).resolve().parent / "database"

    # data/testdata is one level up from this script
    destination = Path(__file__).resolve().parent.parent / "data" / "testdata"
    destination.mkdir(parents=True, exist_ok=True)

    # Safety check
    if not root_dir.exists():
        raise FileNotFoundError(f"Directory not found: {root_dir}")

    for subfolder in root_dir.iterdir():
        if subfolder.is_dir():
            # Look for the .sqlite file inside this subfolder
            sqlite_files = list(subfolder.glob("*.sqlite"))
            for sqlite_file in sqlite_files:
                print(f"Processing: {sqlite_file.name}")

                # copy to data/testdata
                dest_path = destination / sqlite_file.name
                shutil.copy2(sqlite_file, dest_path)
                try:
                    manager = SQLSchemaManager("testdata") 
                    docs = manager.load_schema(sqlite_file)
                    print(docs)
                    manager.create_collection(sqlite_file.name)
                    manager.add_schema_to_collection(sqlite_file.name, docs)
                except Exception as e:
                    print(f"  Error reading {sqlite_file.name}: {e}")
    return 

if __name__ == "__main__":

    # 1: place database folder from spider in this tests dir
    # 2: add .sqlite files into data/testdata 
    # 3: use sql manager to add these database files into chroma database 
    add_db()
    #manager = SQLSchemaManager("testdata") # create a test folder in data before creating manager object