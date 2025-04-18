from scripts.managers.sql_manager import SQLSchemaManager
from scripts.rag.rag_pipeline import Pipeline
import json 
from pathlib import Path
import sqlite3
import shutil
import re

'''
- Extract database id, query, and question from train_spider.json which contains 7000+ set of query and questions
To run this script from the project root: python3 -m tests.process

- add_db(): add .sqlite files into data/testdata, and sql_manager added these files into chroma database
'''

def json_data(file_name):
    path = Path(__file__).resolve().parent / file_name
    with open(path, "r") as f:
        data = json.load(f)
    return data

# creates filtered json file and place it at the project directory 
# I already added it into tests folder, so no need to run this function unless we modify something
def parser():
    path = Path(__file__).resolve().parent / "dev.json"
    with open(path, "r") as f:
        data = json.load(f)

    # Extract db_id, query, and question
    extracted_data = [{"db_id": item["db_id"], "query": item["query"], "question": item["question"]} for item in data]

    with open("filtered_spider.json", "w") as f:
        json.dump(extracted_data, f, indent=2)



def generate_sql_testfile():

    data = json_data("filtered_spider.json")
    model = "codellama:7b-instruct"
    #model = "qwen2.5-coder:7b"

    manager = SQLSchemaManager()
    pipeline = Pipeline()
    pipeline.change_model(model) # change model for testing 
    #destination = Path(__file__).resolve().parent.parent / "data" / "testdata"
    destination = Path(__file__).resolve().parent

    with open("dev_pred_codellama.sql", 'w') as f:
        for i in data:

            db = i["db_id"] + ".sqlite"
            query = i["query"]
            question = i["question"]

            print(f"Processing {i["db_id"]}")

            collection = manager.get_collection(db) # retrieve collection from chroma db
            pipeline.update_collection(collection)
            response = pipeline.run(question) # llm generated response 
            llm_sql = re.sub(r"```sql\s*|```", "", response).strip()
            print(llm_sql)
            trimmed_llm_query = llm_sql.strip(";").replace('\n',' ')
            f.write(f"{trimmed_llm_query}\t{i['db_id']}\n")



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

    manager = SQLSchemaManager("testdata") # create a test folder in data before creating manager object
    for subfolder in root_dir.iterdir():
        if subfolder.is_dir():
            # Look for the .sqlite file inside this subfolder
            sqlite_files = list(subfolder.glob("*.sqlite"))
            for sqlite_file in sqlite_files:
                print(f"Processing: {sqlite_file.name}")

                # copy to data/testdata - for testing, we prob don't need to add sqlite files in data folder 
                dest_path = destination / sqlite_file.name
                shutil.copy2(sqlite_file, dest_path)
                try:
                    docs = manager.load_schema(sqlite_file)
                    print(docs)
                    manager.create_collection(sqlite_file.name)
                    manager.add_schema_to_collection(sqlite_file.name, docs)
                except Exception as e:
                    print(f"  Error reading {sqlite_file.name}: {e}")
    return 

if __name__ == "__main__":

    # 1: place database folder from spider in this tests dir
    # 2: run add_db() function - it adds sqlite files in data/testdata, and chroma database using sql manager
    #add_db()
    #parser()
    generate_sql_testfile()