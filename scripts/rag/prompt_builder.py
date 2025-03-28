'''
Responsible for constrcuting the prompt passed to the LLM using retrieved context

Responsibilities:
- Insert context into a prompt template
- Add instructions to LLM 
- Clean/format user questions 
'''

#TODO: Prompt Engineering - we need to build a good prompt to feed it into LLM 
class PromptBuilder():
    
    def __init__(self):
        self.base_sql_command = "You are an AI assistant that translates natural language questions into SQL queries."
 
    def build_sql_prompt():
        pass