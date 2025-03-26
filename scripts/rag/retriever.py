'''
Responsible for retrieving relevant context chunks from the vector database

Responsibilities:
 - Accept a user question
 - Use a Chroma collection to search for relevant documents
 - Possibly apply filters (by table, source, tags, etc)
'''