# Local LLM Assistant with Chroma + RAG

A lightweight RAG-based assistant using ChromaDB as a local vector store and Sentence-Transformers for embeddings.

## Features
- Vector search over your notes, PDFs, or any text
- Chroma as local, persistent DB
- Easy to plug in OpenAI or local LLMs

## Usage
1. **Install Ollama (for Local LLM Inference)**

   This app uses [Ollama](https://ollama.com) to run Code LLaMA locally.

   **macOS:**
   ```bash
   brew install ollama
   ```

   **Linux**
   ```bash
   curl -fsSL https://ollama.com/install.sh | sh
   ```

2. **Download Code LLaMA**

   Pull the 7B Instruct model:
   ```bash
   ollama pull codellama:7b-instruct
   ```

   You can also pull the 13B Instruct model (better performance, higher memory usage):
   ```bash
   ollama pull codellama:13b-instruct
   ```

3. Put your `.txt`,`.db`, `.pdf` files into `data/`
4. Run the app by typing
   ```bash
   streamlit run app.py
   ```


# High-Level Workflow: Retrieval-Augmented Generation (RAG)

This project uses a modular RAG pipeline to generate SQL queries based on user questions and database schemas. Below is the step-by-step flow of how each component interacts:

---

## Step-by-Step Flow

1. **User Prompt (app.py)**
   - The user selects a `.db` file (e.g. `sakila.db`)
   - Enters a natural language question (e.g. *"List all customers who rented a film in 2022."*)

2. **Schema Extraction (`SQLSchemaManager`)**
   - Loads the schema from the SQLite file
   - Formats each table/column as a text chunk
   - Stores the schema as embeddings in ChromaDB under a named collection

3. **Collection Setup (`ChromaDBManager`)**
   - Manages persistent Chroma collections
   - Creates or retrieves collection by name
   - Used by `SQLSchemaManager` and `RAGPipeline`

4. **RAG Orchestration (`RAGPipeline`)**
   - Coordinates the RAG process:
     - Retrieves relevant schema context
     - Builds a custom prompt
     - Calls an LLM to generate the SQL query

5. **Retrieval (`RAGRetriever`)**
   - Uses Chroma to find the most relevant schema chunks
   - Based on semantic similarity to the user question

6. **Prompt Construction (`PromptBuilder`)**
   - Builds a prompt with:
     - Retrieved schema context
     - The user question
   - Ensures the LLM gets structured input

7. **LLM Generation (`RAGGenerator`)**
   - Sends the prompt to a local or cloud-based LLM
   - Returns a complete SQL query

8. **Answer Return**
   - The final SQL query is returned to `app.py`
   - Optionally executed or displayed to the user

---

## Component Relationship Diagram

```text
app.py
 ├── SQLSchemaManager
 │    └── loads and embeds schema into Chroma
 ├── ChromaDBManager
 │    └── creates and manages Chroma collections
 └── RAGPipeline
      ├── RAGRetriever → gets relevant schema
      ├── PromptBuilder → builds the final prompt
      └── RAGGenerator → generates the SQL

```
---

## Python Environment Setup (Recommended: pyenv)

To ensure you're using the correct Python version and avoid dependency issues:

### 🔧 Create a Python 3.12 virtual environment using `pyenv`

```bash
# Install pyenv if you haven't already
curl https://pyenv.run | bash

# Restart your shell and ensure pyenv is initialized
# (add these lines to ~/.bashrc or ~/.zshrc)
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
source ~/.bashrc  # or ~/.zshrc

# Install Python 3.12.2
pyenv install 3.12.2

# Set Python 3.12.2 as the version for this project
pyenv local 3.12.2

# Create and activate a virtual environment
python -m venv myenv
source myenv/bin/activate

# Install dependencies
pip install --upgrade pip
pip install -r requirements.txt
