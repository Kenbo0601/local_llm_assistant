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


# Spider Evaluation Report

model - qwen2.5-coder:7b

## Question Count per Difficulty

| Metric | Easy | Medium | Hard | Extra | All |
|--------|------|--------|------|-------|-----|
| Count  | 250  | 440    | 174  | 170   | 1034 |

---

## Execution Accuracy

| Metric     | Easy  | Medium | Hard  | Extra | All   |
|------------|-------|--------|-------|--------|--------|
| Execution  | 0.916 | 0.775  | 0.586 | 0.406  | 0.717  |

---

## Exact Match Accuracy

| Metric       | Easy  | Medium | Hard  | Extra | All   |
|--------------|-------|--------|-------|--------|--------|
| Exact Match  | 0.608 | 0.334  | 0.293 | 0.012  | 0.340  |

---

## Partial Matching Accuracy

| Component        | Easy  | Medium | Hard  | Extra | All   |
|------------------|-------|--------|-------|--------|--------|
| select           | 0.977 | 0.953  | 0.943 | 0.619  | 0.945  |
| select(no AGG)   | 0.977 | 0.953  | 0.966 | 0.810  | 0.958  |
| where            | 0.927 | 0.897  | 0.623 | 0.333  | 0.805  |
| where(no OP)     | 0.958 | 0.897  | 0.681 | 0.667  | 0.850  |
| group(no Having) | 0.941 | 0.667  | 1.000 | 0.667  | 0.900  |
| group            | 0.471 | 0.000  | 1.000 | 0.667  | 0.650  |
| order            | 0.950 | 0.936  | 0.889 | 1.000  | 0.934  |
| and/or           | 1.000 | 0.932  | 0.925 | 0.880  | 0.939  |
| IUEN             | 0.000 | 0.000  | 0.750 | 0.000  | 0.667  |
| keywords         | 0.962 | 0.954  | 0.733 | 0.619  | 0.887  |

---

## Partial Matching Recall

| Component        | Easy  | Medium | Hard  | Extra | All   |
|------------------|-------|--------|-------|--------|--------|
| select           | 0.668 | 0.373  | 0.471 | 0.076  | 0.412  |
| select(no AGG)   | 0.668 | 0.373  | 0.483 | 0.100  | 0.418  |
| where            | 0.824 | 0.438  | 0.467 | 0.051  | 0.452  |
| where(no OP)     | 0.852 | 0.438  | 0.511 | 0.102  | 0.477  |
| group(no Having) | 0.800 | 0.015  | 0.359 | 0.051  | 0.134  |
| group            | 0.400 | 0.000  | 0.359 | 0.051  | 0.097  |
| order            | 0.864 | 0.587  | 0.271 | 0.074  | 0.359  |
| and/or           | 1.000 | 0.998  | 0.994 | 0.973  | 0.994  |
| IUEN             | 0.000 | 0.000  | 0.143 | 0.000  | 0.077  |
| keywords         | 0.853 | 0.336  | 0.362 | 0.076  | 0.380  |

---

## Partial Matching F1 Score

| Component        | Easy  | Medium | Hard  | Extra | All   |
|------------------|-------|--------|-------|--------|--------|
| select           | 0.793 | 0.536  | 0.628 | 0.136  | 0.574  |
| select(no AGG)   | 0.793 | 0.536  | 0.644 | 0.178  | 0.582  |
| where            | 0.873 | 0.589  | 0.534 | 0.088  | 0.579  |
| where(no OP)     | 0.902 | 0.589  | 0.584 | 0.177  | 0.611  |
| group(no Having) | 0.865 | 0.030  | 0.528 | 0.094  | 0.233  |
| group            | 0.432 | 1.000  | 0.528 | 0.094  | 0.168  |
| order            | 0.905 | 0.721  | 0.416 | 0.138  | 0.518  |
| and/or           | 1.000 | 0.964  | 0.958 | 0.924  | 0.966  |
| IUEN             | 1.000 | 1.000  | 0.240 | 1.000  | 0.138  |
| keywords         | 0.905 | 0.497  | 0.485 | 0.136  | 0.532  |





