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

2. **Download Ollama Models**

   Pull code llama 7B Instruct model:
   ```bash
   ollama pull codellama:7b-instruct
   ```

   Pull Qwen2.5-coder 7b model (better performance based on our evaluation):
   ```bash
   ollama pull qwen2.5-coder:7b
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
| Qwen2.5-coder| 0.924 | 0.816  | 0.649 | 0.424  | 0.750  |
| Code LLaMA   | 0.740 | 0.584  | 0.253 | 0.218  | 0.506  |

---

## Exact Match Accuracy

| Model        | Easy  | Medium | Hard  | Extra | All   |
|--------------|-------|--------|-------|--------|--------|
| Qwen2.5-coder| 0.544 | 0.309  | 0.299 | 0.012  | 0.315  |
| Code LLaMA   | 0.408 | 0.207  | 0.029 | 0.006  | 0.192  |

---

## Partial Matching Accuracy

| Component        | Qwen-E | Qwen-M | Qwen-H | Qwen-X | Qwen-All | LLaMA-E | LLaMA-M | LLaMA-H | LLaMA-X | LLaMA-All |
|------------------|--------|--------|--------|--------|----------|----------|----------|----------|----------|-----------|
| select           | 0.975  | 0.958  | 0.964  | 0.708  | 0.952    | 0.815    | 0.921    | 0.897    | 0.680    | 0.862     |
| select(no AGG)   | 0.975  | 0.958  | 0.964  | 0.792  | 0.956    | 0.894    | 0.944    | 0.966    | 0.760    | 0.914     |
| where            | 0.889  | 0.850  | 0.603  | 0.294  | 0.764    | 0.797    | 0.513    | 0.357    | 0.286    | 0.575     |
| where(no OP)     | 0.911  | 0.850  | 0.667  | 0.706  | 0.816    | 0.823    | 0.521    | 0.393    | 0.357    | 0.596     |
| group(no Having) | 0.944  | 0.500  | 0.938  | 0.571  | 0.844    | 1.000    | 0.769    | 0.500    | 0.417    | 0.621     |
| group            | 0.444  | 0.250  | 0.938  | 0.571  | 0.622    | 0.000    | 0.308    | 0.500    | 0.417    | 0.345     |
| order            | 0.905  | 0.932  | 0.889  | 0.714  | 0.900    | 0.895    | 0.882    | 0.667    | 0.267    | 0.704     |
| and/or           | 1.000  | 0.925  | 0.919  | 0.875  | 0.934    | 1.000    | 0.945    | 0.922    | 0.886    | 0.945     |
| IUEN             | 0.000  | 0.000  | 0.778  | 0.000  | 0.700    | 0.000    | 0.000    | 0.000    | 0.000    | 0.000     |
| keywords         | 0.969  | 0.959  | 0.750  | 0.750  | 0.900    | 0.860    | 0.688    | 0.345    | 0.440    | 0.692     |

---

## Partial Matching Recall

| Component        | Qwen-E | Qwen-M | Qwen-H | Qwen-X | Qwen-All | LLaMA-E | LLaMA-M | LLaMA-H | LLaMA-X | LLaMA-All |
|------------------|--------|--------|--------|--------|----------|----------|----------|----------|----------|-----------|
| select           | 0.620  | 0.364  | 0.466  | 0.100  | 0.399    | 0.492    | 0.373    | 0.149    | 0.100    | 0.319     |
| select(no AGG)   | 0.620  | 0.364  | 0.466  | 0.112  | 0.401    | 0.540    | 0.382    | 0.161    | 0.112    | 0.338     |
| where            | 0.741  | 0.382  | 0.413  | 0.051  | 0.401    | 0.583    | 0.343    | 0.109    | 0.041    | 0.290     |
| where(no OP)     | 0.759  | 0.382  | 0.457  | 0.122  | 0.429    | 0.602    | 0.348    | 0.120    | 0.051    | 0.300     |
| group(no Having) | 0.850  | 0.015  | 0.385  | 0.051  | 0.141    | 0.100    | 0.076    | 0.026    | 0.063    | 0.067     |
| group            | 0.400  | 0.008  | 0.385  | 0.051  | 0.104    | 0.000    | 0.031    | 0.026    | 0.063    | 0.037     |
| order            | 0.864  | 0.547  | 0.271  | 0.062  | 0.342    | 0.773    | 0.200    | 0.034    | 0.049    | 0.160     |
| and/or           | 0.996  | 0.998  | 0.994  | 0.987  | 0.995    | 1.000    | 0.988    | 0.950    | 0.980    | 0.984     |
| IUEN             | 0.000  | 0.000  | 0.167  | 0.000  | 0.090    | 0.000    | 0.000    | 0.000    | 0.000    | 0.000     |
| keywords         | 0.833  | 0.317  | 0.362  | 0.106  | 0.374    | 0.573    | 0.255    | 0.057    | 0.065    | 0.233     |

---

## Partial Matching F1 Score

| Component        | Qwen-E | Qwen-M | Qwen-H | Qwen-X | Qwen-All | LLaMA-E | LLaMA-M | LLaMA-H | LLaMA-X | LLaMA-All |
|------------------|--------|--------|--------|--------|----------|----------|----------|----------|----------|-----------|
| select           | 0.758  | 0.527  | 0.628  | 0.175  | 0.563    | 0.613    | 0.531    | 0.256    | 0.174    | 0.466     |
| select(no AGG)   | 0.758  | 0.527  | 0.628  | 0.196  | 0.565    | 0.673    | 0.544    | 0.276    | 0.195    | 0.494     |
| where            | 0.808  | 0.527  | 0.490  | 0.087  | 0.526    | 0.674    | 0.411    | 0.167    | 0.071    | 0.385     |
| where(no OP)     | 0.828  | 0.527  | 0.542  | 0.209  | 0.562    | 0.695    | 0.418    | 0.183    | 0.089    | 0.399     |
| group(no Having) | 0.895  | 0.030  | 0.545  | 0.093  | 0.242    | 0.182    | 0.139    | 0.049    | 0.110    | 0.121     |
| group            | 0.421  | 0.015  | 0.545  | 0.093  | 0.178    | 1.000    | 0.056    | 0.049    | 0.110    | 0.067     |
| order            | 0.884  | 0.689  | 0.416  | 0.114  | 0.495    | 0.829    | 0.326    | 0.065    | 0.083    | 0.261     |
| and/or           | 0.998  | 0.960  | 0.955  | 0.927  | 0.963    | 1.000    | 0.966    | 0.936    | 0.931    | 0.964     |
| IUEN             | 1.000  | 1.000  | 0.275  | 1.000  | 0.159    | 1.000    | 1.000    | 1.000    | 1.000    | 1.000     |
| keywords         | 0.896  | 0.477  | 0.488  | 0.186  | 0.529    | 0.688    | 0.373    | 0.099    | 0.113    | 0.349     |
