import chromadb

# Manages chroma database 
class ChromaDBManager:
    def __init__(self, path="../chroma_db"):
        self.client = chromadb.PersistentClient(path=path) # if the directory does not exist, it creates an empty chroma dabase 
        self.collections = {}

    def create_collection(self,name):
        pass

    def get_collection(self,name):
        pass


ChromaDBManager()