from langchain_ollama import ChatOllama
from langchain.schema import HumanMessage

'''
Responsible for calling the LLM to generate a response 

Responsibilities:
 - Interface with LLMs 
 - Call the model with the prompt and return the output 
'''

class Generator:
    
    def __init__(self, model_name="codellama:7b-instruct", temperature=0.2):
        self.llm = ChatOllama(model=model_name, temperature=temperature)
    
    def generate_sql(self, prompt: str) -> str:
        response = self.llm.invoke([HumanMessage(content=prompt)])
        print(response.content)