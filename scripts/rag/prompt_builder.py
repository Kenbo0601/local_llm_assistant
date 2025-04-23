'''
Responsible for constrcuting the prompt passed to the LLM using retrieved context

Responsibilities:
- Insert context into a prompt template
- Add instructions to LLM 
- Clean/format user questions 
'''

#TODO: Prompt Engineering - we need to build a good prompt to feed it into LLM 
class PromptBuilder:
    
    def __init__(self):
        self.keywords = ["Columns:", "Foreign Keys:"]
 
    def build_sql_prompt(self, user_question: str, context_chunks: list[str]) -> str: 

        # format each table and its columns 
        def format_chunks(chunk: str) -> str:
            lines = chunk.strip().split("\n") # remove whitespace then split with new lines - separate table, column, foreign key
            table_line = lines[0]
            formatted = [table_line]

            for line in lines[1:]: # format column and foreign key lines 
                if line.startswith(self.keywords[0]): # handle Coulmns 
                    columns = line.replace(self.keywords[0],"").strip().split(", ")
                    formatted.append(self.keywords[0])
                    for col in columns:
                        formatted.append(f"- {col.replace('(PK)', '(Primary Key)')}")
                elif line.startswith(self.keywords[1]): # handle Foreign Keys
                    fks = line.replace(self.keywords[1], "").strip().split(", ")
                    formatted.append(self.keywords[1])
                    for fk in fks:
                        formatted.append(f"- {fk}")
            return "\n".join(formatted)

        formatted_schema = "\n\n".join(format_chunks(chunk) for chunk in context_chunks)
        print(formatted_schema)

        prompt = f"""You are an AI assistant that translates natural language questions into SQL queries.

        Use the provided database schema to guide your answer. If required tables or keys are not shown, you may infer their structure based on common patterns.
        
        Use JOINs if necessary. Do not explain the result — just return the SQL query.

        ### Database Schema:
        {formatted_schema}

        ### User Question:
        {user_question}"""

        return prompt




