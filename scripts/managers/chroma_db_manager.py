from langchain_huggingface import HuggingFaceEmbeddings
from langchain_chroma import Chroma
from pathlib import Path

# Manager classes manage chroma logic - create/get collections from database etc
# Child classes handles tasks for specific collections - ex: Sql_manager takes care of sql collections in the database


# Base Manager Class
class ChromaDBManager:
    def __init__(self):
        self.base_path = Path(__file__).resolve().parents[2] # get absolute path to project root (2 levels up from this file)
        self.db_path = str(self.base_path / "chroma_db") # chroma_db folder should be located in the top level - we also need to convert Path object -> str for later use
        self.embedding_function = HuggingFaceEmbeddings(model_name="all-MiniLM-L6-v2",  model_kwargs={"device": "cpu"}) # sentence transformer model - this model is small and fast
        self.collections = {}

    # Create collection in chroma database with collection name - ex: pdf_chunks
    def create_collection(self,collection_name):
        db = Chroma(
            collection_name=collection_name,
            embedding_function=self.embedding_function,
            persist_directory=self.db_path
        )
        self.collections[collection_name] = db
        print(f"[+] Added collection '{collection_name}' into chroma_db.")
        return db

    # pull data with collection name from chroma database
    def get_collection(self,collection_name):
        if collection_name in self.collections:
            return self.collections.get(collection_name)
        else:
            # Load it from disk using LangChain's Chroma wrapper
            db = Chroma(
                collection_name=collection_name,
                embedding_function=self.embedding_function,
                persist_directory=self.db_path
            )
            self.collections[collection_name] = db
            print(f"[+] Loaded collection '{collection_name}' from disk.")
            return db

    # retrieve all collections in the database
    def get_all_collections(self):
        db = Chroma(persist_directory=self.db_path)
        client = db._client
        collections = client.list_collections()
        # when using chroma + langchain, langchain creates a default collection named "langchain"
        # under the hood, so we filter it before returning as a list of collection names
        filtered = [col for col in collections if col != "langchain"] 
        return filtered