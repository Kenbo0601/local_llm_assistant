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

**Models**: 
 - `qwen2.5-coder:7b`
 - `codellama:7b-instruct`

**Evaluation Tool**: [test-suite-sql-eval](https://github.com/taoyds/test-suite-sql-eval.git)

## How the Testing Works

The evaluation measures how accurately a language model can translate natural language questions into SQL queries. It compares the model's output to the correct (gold) SQL queries using three main methods:

### Execution Accuracy
- Checks whether the **generated SQL returns the same result** as the gold SQL when run on the database.
- This is the most practical metric for real-world applications.

### Exact Match Accuracy
- Compares whether the generated SQL is **structurally identical** to the gold SQL.
- Sensitive to formatting, aliasing, and clause order — even if functionally correct.

### Partial Match Evaluation
Breaks the query into components and compares them individually:
- **SELECT**
- **WHERE**
- **GROUP BY**
- **ORDER BY**
- **AND/OR logic**
- **Set operations (IUEN)**: INTERSECT, UNION, EXCEPT, NOT IN
- Also includes versions that ignore aggregations or operators for more flexibility

Each component is scored by:
- **Precision** (does the generated part include valid elements?)
- **Recall** (did the model miss important parts?)
- **F1 score** (harmonic mean of precision and recall)

### Difficulty Levels
Each question is labeled as `easy`, `medium`, `hard`, or `extra` based on the complexity of the SQL needed:
- `easy`: single-table, no joins
- `medium`: joins or simple aggregation
- `hard`: subqueries, nested conditions
- `extra`: multiple joins, nested queries, set operations

---

## Question Count per Difficulty

| Metric | Easy | Medium | Hard | Extra | All |
|--------|------|--------|------|-------|-----|
| Count  | 250  | 440    | 174  | 170   | 1034 |

---

## Execution Accuracy

| Model        | Easy  | Medium | Hard  | Extra | All   |
|--------------|-------|--------|-------|--------|--------|
| Qwen2.5-coder| 0.916 | 0.775  | 0.586 | 0.406  | 0.717  |
| Code LLaMA   | 0.740 | 0.584  | 0.253 | 0.218  | 0.506  |

---

## Exact Match Accuracy

| Model        | Easy  | Medium | Hard  | Extra | All   |
|--------------|-------|--------|-------|--------|--------|
| Qwen2.5-coder| 0.608 | 0.334  | 0.293 | 0.012  | 0.340  |
| Code LLaMA   | 0.408 | 0.207  | 0.029 | 0.006  | 0.192  |

---

## Partial Matching Accuracy

| Component        | Qwen-E | Qwen-M | Qwen-H | Qwen-X | Qwen-All | LLaMA-E | LLaMA-M | LLaMA-H | LLaMA-X | LLaMA-All |
|------------------|--------|--------|--------|--------|----------|----------|----------|----------|----------|-----------|
| select           | 0.977  | 0.953  | 0.943  | 0.619  | 0.945    | 0.815    | 0.921    | 0.897    | 0.680    | 0.862     |
| select(no AGG)   | 0.977  | 0.953  | 0.966  | 0.810  | 0.958    | 0.894    | 0.944    | 0.966    | 0.760    | 0.914     |
| where            | 0.927  | 0.897  | 0.623  | 0.333  | 0.805    | 0.797    | 0.513    | 0.357    | 0.286    | 0.575     |
| where(no OP)     | 0.958  | 0.897  | 0.681  | 0.667  | 0.850    | 0.823    | 0.521    | 0.393    | 0.357    | 0.596     |
| group(no Having) | 0.941  | 0.667  | 1.000  | 0.667  | 0.900    | 1.000    | 0.769    | 0.500    | 0.417    | 0.621     |
| group            | 0.471  | 0.000  | 1.000  | 0.667  | 0.650    | 0.000    | 0.308    | 0.500    | 0.417    | 0.345     |
| order            | 0.950  | 0.936  | 0.889  | 1.000  | 0.934    | 0.895    | 0.882    | 0.667    | 0.267    | 0.704     |
| and/or           | 1.000  | 0.932  | 0.925  | 0.880  | 0.939    | 1.000    | 0.945    | 0.922    | 0.886    | 0.945     |
| IUEN             | 0.000  | 0.000  | 0.750  | 0.000  | 0.667    | 0.000    | 0.000    | 0.000    | 0.000    | 0.000     |
| keywords         | 0.962  | 0.954  | 0.733  | 0.619  | 0.887    | 0.860    | 0.688    | 0.345    | 0.440    | 0.692     |

---

## Partial Matching Recall

| Component        | Qwen-E | Qwen-M | Qwen-H | Qwen-X | Qwen-All | LLaMA-E | LLaMA-M | LLaMA-H | LLaMA-X | LLaMA-All |
|------------------|--------|--------|--------|--------|----------|----------|----------|----------|----------|-----------|
| select           | 0.668  | 0.373  | 0.471  | 0.076  | 0.412    | 0.492    | 0.373    | 0.149    | 0.100    | 0.319     |
| select(no AGG)   | 0.668  | 0.373  | 0.483  | 0.100  | 0.418    | 0.540    | 0.382    | 0.161    | 0.112    | 0.338     |
| where            | 0.824  | 0.438  | 0.467  | 0.051  | 0.452    | 0.583    | 0.343    | 0.109    | 0.041    | 0.290     |
| where(no OP)     | 0.852  | 0.438  | 0.511  | 0.102  | 0.477    | 0.602    | 0.348    | 0.120    | 0.051    | 0.300     |
| group(no Having) | 0.800  | 0.015  | 0.359  | 0.051  | 0.134    | 0.100    | 0.076    | 0.026    | 0.063    | 0.067     |
| group            | 0.400  | 0.000  | 0.359  | 0.051  | 0.097    | 0.000    | 0.031    | 0.026    | 0.063    | 0.037     |
| order            | 0.864  | 0.587  | 0.271  | 0.074  | 0.359    | 0.773    | 0.200    | 0.034    | 0.049    | 0.160     |
| and/or           | 1.000  | 0.998  | 0.994  | 0.973  | 0.994    | 1.000    | 0.988    | 0.950    | 0.980    | 0.984     |
| IUEN             | 0.000  | 0.000  | 0.143  | 0.000  | 0.077    | 0.000    | 0.000    | 0.000    | 0.000    | 0.000     |
| keywords         | 0.853  | 0.336  | 0.362  | 0.076  | 0.380    | 0.573    | 0.255    | 0.057    | 0.065    | 0.233     |

---

## Partial Matching F1 Score

| Component        | Qwen-E | Qwen-M | Qwen-H | Qwen-X | Qwen-All | LLaMA-E | LLaMA-M | LLaMA-H | LLaMA-X | LLaMA-All |
|------------------|--------|--------|--------|--------|----------|----------|----------|----------|----------|-----------|
| select           | 0.793  | 0.536  | 0.628  | 0.136  | 0.574    | 0.613    | 0.531    | 0.256    | 0.174    | 0.466     |
| select(no AGG)   | 0.793  | 0.536  | 0.644  | 0.178  | 0.582    | 0.673    | 0.544    | 0.276    | 0.195    | 0.494     |
| where            | 0.873  | 0.589  | 0.534  | 0.088  | 0.579    | 0.674    | 0.411    | 0.167    | 0.071    | 0.385     |
| where(no OP)     | 0.902  | 0.589  | 0.584  | 0.177  | 0.611    | 0.695    | 0.418    | 0.183    | 0.089    | 0.399     |
| group(no Having) | 0.865  | 0.030  | 0.528  | 0.094  | 0.233    | 0.182    | 0.139    | 0.049    | 0.110    | 0.121     |
| group            | 0.432  | 1.000  | 0.528  | 0.094  | 0.168    | 1.000    | 0.056    | 0.049    | 0.110    | 0.067     |
| order            | 0.905  | 0.721  | 0.416  | 0.138  | 0.518    | 0.829    | 0.326    | 0.065    | 0.083    | 0.261     |
| and/or           | 1.000  | 0.964  | 0.958  | 0.924  | 0.966    | 1.000    | 0.966    | 0.936    | 0.931    | 0.964     |
| IUEN             | 1.000  | 1.000  | 0.240  | 1.000  | 0.138    | 1.000    | 1.000    | 1.000    | 1.000    | 1.000     |
| keywords         | 0.905  | 0.497  | 0.485  | 0.136  | 0.532    | 0.688    | 0.373    | 0.099    | 0.113    | 0.349     |


