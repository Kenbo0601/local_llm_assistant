from managers.chroma_db_manager import ChromaDBManager
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain_community.document_loaders import PyMuPDFLoader

# Child Class - Handle PDF documents
class PDFManager(ChromaDBManager):

    def __init__(self):
        super().__init__()
        self.data_path = self.base_path / "data" / "pdf"
    
    def load_pdf(self, doc_name):
        loader = PyMuPDFLoader(self.data_path / doc_name)
        docs = loader.load()
        text_splitter = RecursiveCharacterTextSplitter(chunk_size=500, chunk_overlap=100)
        chunks = text_splitter.split_documents(docs)

        # print contents for testing
        for i, chunk in enumerate(chunks):
            print(f"\n--- Chunk {i+1} ---")
            print(chunk.page_content)
        
        return chunks
    
    # add documents into existing collection - need to specify collection name 
    def add_documents_to_collection(self, collection_name, documents):
        if collection_name not in self.collections:
            raise ValueError(f"Collection '{collection_name}' not found. Create it first.")
        self.collections[collection_name].add_documents(documents)
        print(f"[+] Added {len(documents)} chunks to collection '{collection_name}'.")