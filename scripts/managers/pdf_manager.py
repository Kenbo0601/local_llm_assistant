from managers.chroma_db_manager import ChromaDBManager

# Child Class - Handle PDF documents
class PDFManager(ChromaDBManager):

    def __init__(self):
        super().__init__()
    
    # add documents into existing collection - need to specify collection name 
    def add_documents_to_collection(self, collection_name, documents):
        if collection_name not in self.collections:
            raise ValueError(f"Collection '{collection_name}' not found. Create it first.")
        self.collections[collection_name].add_documents(documents)
        print(f"[+] Added {len(documents)} chunks to collection '{collection_name}'.")