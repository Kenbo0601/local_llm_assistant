'''
Responsible for retrieving relevant context chunks from the vector database

Responsibilities:
 - Accept a user question
 - Use a Chroma collection to search for relevant documents
 - Possibly apply filters (by table, source, tags, etc)

 how to query  - https://python.langchain.com/docs/integrations/retrievers/self_query/chroma_self_query/
'''

class Retriever:

    def __init__(self, collection, top_k: int = 10):
        """
        Initialize the retriever with a Chroma collection.
        
        Args:
            collection: A LangChain Chroma vectorstore collection.
            top_k (int): Number of top relevant chunks to retrieve.
        """
        self.top_k = top_k
        self.update_collection(collection)

    # when user selects different collection, pipeline invokes this function 
    def update_collection(self,collection):
        self.collection = collection

    def retrieve_context(self, question: str):
        """
        Retrieves relevant documents from the Chroma collection based on the input question.

        Args:
            question (str): The user's natural language question.

        Returns:
            List[str]: List of retrieved schema texts (page_content).
        """

        # we can probably move this retriver into retrieve_context function 
        # we can extract table names from user's question but ..
        # then we somehow need to know all the table names that the user is currently selecting, 
        # then implement a function to extract table names 
        # then we can do something like this; retriever = self.collection.as_retriever(search_kwargs={"k": 3, "filter": {"table": table_filter}})
        self.retriever = self.collection.as_retriever(search_kwargs={"k": self.top_k})
        documents = self.retriever.invoke(question)
        seen_tables = set()
        unique_chunks = []

        for doc in documents:
            content = doc.page_content

            # Extract table name using simple parsing (assumes format: "Table: name")
            if "Table:" in content:
                table_line = next(line for line in content.splitlines() if line.startswith("Table:"))
                table_name = table_line.replace("Table:", "").strip().lower()
            else:
                continue  # skip if table name can't be found

            if table_name not in seen_tables:
                seen_tables.add(table_name)
                unique_chunks.append(content)

            if len(unique_chunks) == self.top_k:
                break
        
        return unique_chunks
        #return [doc.page_content for doc in documents] 
    