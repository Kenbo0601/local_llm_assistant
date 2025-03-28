'''
Responsible for retrieving relevant context chunks from the vector database

Responsibilities:
 - Accept a user question
 - Use a Chroma collection to search for relevant documents
 - Possibly apply filters (by table, source, tags, etc)

 how to query  - https://python.langchain.com/docs/integrations/retrievers/self_query/chroma_self_query/
'''

class Retriever:

    def __init__(self, collection, top_k: int = 6):
        """
        Initialize the retriever with a Chroma collection.
        
        Args:
            collection: A LangChain Chroma vectorstore collection.
            top_k (int): Number of top relevant chunks to retrieve.
        """
        self.retriever = collection.as_retriever(search_kwargs={"k": top_k})

    def retrieve_context(self, question: str):
        """
        Retrieves relevant documents from the Chroma collection based on the input question.

        Args:
            question (str): The user's natural language question.

        Returns:
            List[str]: List of retrieved schema texts (page_content).
        """
        documents = self.retriever.invoke(question)
        return [doc.page_content for doc in documents] 
    