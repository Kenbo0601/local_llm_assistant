# Local LLM Assistant with Chroma + RAG

A lightweight RAG-based assistant using ChromaDB as a local vector store and Sentence-Transformers for embeddings.

## Features
- Vector search over your notes, PDFs, or any text
- Chroma as local, persistent DB
- Easy to plug in OpenAI or local LLMs

## Usage
1. Put your `.txt` files into `data/`
2. Run `scripts/loader.py` to load them
3. Use `app.py` to query your assistant
