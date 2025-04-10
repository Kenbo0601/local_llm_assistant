# A lightweight RAG-based local LLM assistant 

This app is a fully local Text-to-SQL assistant that runs on your own machine — no data ever leaves your computer.

It uses a lightweight Retrieval-Augmented Generation (RAG) system built with ChromaDB as the vector store and Sentence-Transformers for embeddings. The goal is to allow users to query their structured data (SQLite `.db` files) using natural language, powered by a local Large Language Model (LLM).

## Features
- 💾 **Local Vector Database with ChromaDB**  
  Store your `.db` files locally, and the app will create a vectorized representation of your database schema and sample data.

- 🤖 **LLM-Powered SQL Generation**  
  Uses a local LLM (no API keys or internet required) to generate SQL queries from your natural language questions.

- 🔍 **RAG-Based Querying**  
  Retrieves relevant database information and context before generating a query, increasing accuracy and relevance.

- 🔐 **Fully Local Execution**  
  Privacy-focused — no external services or cloud dependencies.

- ⚡ **Lightweight and Easy to Use**  
  Simple UI to load databases, manage collections, and interact with your data using a chat interface.


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

3. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

4. **Run the App**

   You have two options for running the application:

   ### Option A: Standard Streamlit Command

   Run the app directly with Streamlit:

   ```bash
   streamlit run app.py
   ```

   ### Option B: Use a Shell Script

   Make the ```run.sh``` script executable
   ```bash
   chmod +x run.sh
   ```

   Then run the app with:
   ```bash
   ./run.sh
   ```

---

## Python Environment Setup (Recommended: pyenv)

To ensure you're using the correct Python version and avoid dependency issues:

### Create a Python 3.10+ virtual environment using `pyenv`
Follow the official pyenv installation guide to install and manage Python versions:<br />
Official Documentation: [Visit pyenv GitHub](https://github.com/pyenv/pyenv)


### Create and activate a virtual environment in the project folder
```bash
python -m venv myenv
source myenv/bin/activate
```

---

## Getting Started with the Text-to-SQL app
This guide will walk you through how to set up and use the application interface to generate SQL queries from natural languages.

### Step-by-Step Instructions

1. **Place Your DB Files**  
   Put your `.db` files into the `data/` folder of the project.

2. **Load a DB File into the Vector Database**
   - Open the app.
   - On the **top left sidebar**, select a `.db` file.
   - Click the **'Upload'** button.
   - This action creates a collection for your selected DB file in your local vector database.

3. **Select a Collection for Text-to-SQL**
   - On the **bottom left sidebar**, choose the collection you want to use.
   - After selecting it, you're ready to ask questions.

4. **Start Chatting**
   - Type your natural language query into the chatbox.
   - The app will generate the corresponding SQL query using the selected database collection.

You are all set! Start exploring your databases with natural language queries.

---


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


