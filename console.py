import re
import scripts.util.utils as utils
from scripts.rag.rag_pipeline import Pipeline
from scripts.managers.sql_manager import SQLSchemaManager


pipeline = Pipeline()
schema_manager = SQLSchemaManager()

selected_model = None
selected_collection = None

invalid_arg_message = "Invalid argument. Please enter a valid argument."

print("===== RAG SQL Console =====")
print("Available commands")
print("exit\n\tQuit and exit the program.")
print("load collections\n\tAdds all documents from /data/db into schema collections.")
print("list models\n\tList all available models.")
print("list collections\n\tList all available collections.")
print("list selected\n\tView selected model and collection.")
print("select model <model name>\n\tSelect the model to use.")
print("select collection <collection name>\n\tSelect the collection to use.")
print("query <query>\n\tQuery the model.")

while True:
    user_input = str(input(">>")).lower().strip()

    if len(user_input) == 0:
        continue

    if user_input == "exit":    # Stop the loop
        break
    elif user_input == "help":  # List available commands in the console
        print("exit\n\tQuit and exit the program.")
        print("load collections\n\tAdds all documents from /data/db into schema collections.")
        print("list models\n\tList all available models.")
        print("list collections\n\tList all available collections.")
        print("list selected\n\tView selected model and collection.")
        print("select model <model name>\n\tSelect the model to use.")
        print("select collection <collection name>\n\tSelect the collection to use.")
        print("query <query>\n\tQuery the model.")
    elif user_input == "list models":   # Print available models
        print(utils.get_ollama_models())
    elif user_input == "list collections":  # Print available collections
        print(schema_manager.get_all_collections())
    elif user_input == "list selected": # Print the selected model and selected collection
        if selected_model is None:
            print("No model selected.")
        else:
            print("Selected model:", selected_model)

        if selected_collection is None:
            print("No collection selected.")
        else:
            print("Selected collection:", selected_collection._collection_name)
    elif user_input.split()[0] == "select":
        if len(user_input.split()) < 2: # Makes sure the select call specifies what it is selecting (either a model or collection)
            print(invalid_arg_message)
            continue

        if user_input.split()[1] == "model":
            if len(user_input.split()) < 3: # Print a message to let the user know how to select a model
                print("Select a model to use with \"select model <model name>\"")
                continue

            if user_input.split()[2] in utils.get_ollama_models():    # Check if the model is valid
                print("Using model", user_input.split()[2])
                selected_model = user_input.split()[2]
                pipeline.change_model(selected_model)
            else:
                print("Could not find model", user_input.split()[2])

        if user_input.split()[1] == "collection":
            if len(user_input.split()) < 3: # print a message to let the user know how to select a collection
                print("Select a collection to use with \"select collection <collection name>\"")
                continue

            if user_input.split()[2] in schema_manager.get_all_collections():   # Check if the collection is valid
                print("Using collection", user_input.split()[2])
                selected_collection = user_input.split()[2]
                selected_collection = schema_manager.get_collection(selected_collection)
            else:
                print("Could not find collection", user_input.split()[2])
    elif user_input.split()[0] == "query":  # Sends a query to the LLM
        if selected_model is None:  # Check if a model is selected
            print("Select a model first using \"select model <model name>\".")
            continue
        if selected_collection is None:   # Check if a collection is selected
            print("Select a collection first using \"select collection <collection name>\".")
            continue
        if len(user_input.split()) < 2: # Print a message to let the user know they have to write a query
            print("Write a query after the query command with \"select query <query>\"")
            continue

        pipeline.update_collection(selected_collection)
        result = pipeline.run(" ".join(user_input.split()[1:]), verbose=False)
        print(re.sub(r"```sql\s*|```", "", result).strip())
    elif user_input == "load collections":  # Add .db files from /data into schema collections
        for collection_file in utils.get_documents():
            collection = collection_file.split("/")[1]

            if collection[-3:] != ".db":
                continue

            docs = schema_manager.load_schema(collection)
            schema_manager.create_collection(collection)
            schema_manager.add_schema_to_collection(collection, docs)

        print("Finished adding documents to schema collection.")
    else:
        print(invalid_arg_message)


