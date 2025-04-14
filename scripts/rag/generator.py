from langchain_ollama import ChatOllama
from langchain.schema import HumanMessage
import subprocess

'''
Responsible for calling the LLM to generate a response 

Responsibilities:
 - Interface with LLMs 
 - Call the model with the prompt and return the output 
'''

#TODO: need to add a method for changing models 
# Currently we are only using Ollama models, if we want to try another models, we have to implement a method 
# so that when user selects ollama model, we call ChatOllama method from langchain 
class Generator:

    def __init__(self, model_name="codellama:7b-instruct", temperature=0.2):
        #self.llm = ChatOllama(model=model_name, temperature=temperature)
        self.llm = None
        self.temperature = temperature
        self.model_name = None
        self.set_model(model_name)

    # Make sure if model is available in the system 
    def _is_model_available(self, model_name: str) -> bool:
        try:
            result = subprocess.run(["ollama", "list"], capture_output=True, text=True)
            return model_name in result.stdout
        except Exception as e:
            print(f"Error checking for model: {e}")
            return False

    # method for switching the models in the app
    def set_model(self, model_name: str):
        if self._is_model_available(model_name):
            self.llm = ChatOllama(model=model_name, temperature=self.temperature)
            self.model_name = model_name
            print(f"Model switched to: {model_name}")
        else:
            self.llm = None
            self.model_name = None
            print(f"Model '{model_name}' not found locally.")
        return 

    
    def generate_sql(self, prompt: str) -> str:
        response = self.llm.invoke([HumanMessage(content=prompt)])
        #print(response.content)
        return response.content