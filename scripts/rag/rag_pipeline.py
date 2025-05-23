from scripts.rag.retriever import Retriever
from scripts.rag.prompt_builder import PromptBuilder
from scripts.rag.generator import Generator
'''
The orchestrator - ties everything together: retrieval -> prompt -> generation 

Responsibilities:
 - Accept user query 
 - Use Retriever to get context
 - Use PromptBuilder to build prompt 
 - Use Generator to get final response 
'''

class Pipeline:
    
    def __init__(self):
        self.collection = None
        self.retriever = None
        self.prompt_builder = PromptBuilder()
        self.generator = Generator()

    # We only need to create only one Pipeline object. 
    # When user switches collection, invoke this function to update collection. 
    # this function also calls update_collection in retriever class. 
    def update_collection(self, new_collection):
        self.collection = new_collection
        
        if self.retriever is None: # first time using retriever 
            self.retriever = Retriever(new_collection)
        else:
            self.retriever.update_collection(new_collection) # every time user switches collection, update collection in retriever

    # invoke set_model function in generator class
    def change_model(self, new_model_name):
        self.generator.set_model(new_model_name)
    
    def run(self, user_question, verbose = True) -> str:
        # 1: retriever finds and returns relavant data
        context_chunks = self.retriever.retrieve_context(user_question)
        if verbose:
            for i, chunk in enumerate(context_chunks):
                print(f"chunk{i}:\n{chunk}\n")

        # 2: build prompt for LLM 
        prompt = self.prompt_builder.build_sql_prompt(user_question, context_chunks, verbose=verbose)

        return self.generator.generate_sql(prompt)