# script for UI/user interaction 
from scripts.rag.retriever import Retriever
from scripts.managers.sql_manager import SQLSchemaManager
from scripts.rag.rag_pipeline import Pipeline
import streamlit as st
import random
import string
import subprocess
from pathlib import Path


# initialize objects so that we won't recreate copies while the app is running
if "pipeline" not in st.session_state:
    st.session_state.pipeline = Pipeline()

if "schema_manager" not in st.session_state:
    st.session_state.schema_manager = SQLSchemaManager()



# ─────────────────────────────
#  Functions 
# ─────────────────────────────

# Retrieve ollama models from user's system
def get_ollama_models():
    try:
        result = subprocess.run(["ollama", "list"], capture_output=True, text=True, check=True)
        models = []
        for line in result.stdout.strip().split("\n")[1:]:  # Skip header
            if line.strip():
                model_name = line.split()[0]
                models.append(model_name)
        return models
    except Exception as e:
        st.error(f"Error retrieving Ollama models: {e}")
        return []


# Go into data folder and grab documents
def display_documents():
    # Root data folder
    data_folder = Path("data")

    # Recursively find all .db and .pdf files
    file_types = ["*.db", "*.pdf"]
    all_files = []
    for pattern in file_types:
        all_files.extend(data_folder.glob(f"**/{pattern}"))

    # Display files as relative paths (e.g., "db/sakila.db")
    file_labels = [str(f.relative_to(data_folder)) for f in all_files]
    return file_labels


# for sidebar - section 1
def create_collection():
    # when user selects document and load_submitted button was pushed (sidebar - section1),
    # manager is responsible for creating collections and adding them into vector database. 
    # for now, we have sql and pdf managers, so if a user selects a .db file, then 
    # 1: strip db/name.db -> name.db 
    # 2: invoke manager.create_collection(file_name) -> this will create a collection into database
    # 3: then call manager.add to collection method (currently only add_schema_to_collection is available)
    return 

# for sidebar - section 2
def select_collection():
    # "select collection" in sidebar in the app. 
    # 1: display available collections in the database 
    # 2: when user selects collection, invoke pipeline.update_collection so that RAG knows which collection to go into 
    return 


# TODO: pass the model name so that it switches inside the generator 
def generate_sql_response(user_message: str, pipeline, collection):
    pipeline.update_collection(collection)
    response = pipeline.run(user_message)
    return response


# ─────────────────────────────
#  Streamlit App Layout
# ─────────────────────────────

# To run: streamlit run app.py

st.set_page_config(page_title="Personal LLM Assistant", layout="centered")

#st.title("Personal LLM Assistant")


# Set page layout to wide
#st.set_page_config(layout="wide")

# ───── Sidebar: Left Panel ─────
with st.sidebar:
    st.title("🤖 RAG Assistant")

    # ───── Section 1: Load Document ─────
    st.markdown("#### 📄 Load Document")
    st.caption("Let’s add new documents into your system!")

    with st.form(key="load_doc_form"):
        load_doc = st.selectbox("Select Document", display_documents())
        load_submitted = st.form_submit_button("Load")
        if load_submitted:
            st.success(f"Loaded document: {load_doc}")

    st.markdown("---")  # Optional divider

    # ───── Section 2: Other Options ─────
    #st.selectbox("Available Collections", ["sakila", "chinook", "custom.db"])
    collection = st.selectbox("Select Collection", ["sakila", "chinook", "custom.db"])
    # Get available models
    ollama_models = get_ollama_models()

    # Display them in a selectbox
    if ollama_models:
        selected_model = st.selectbox("Select Ollama Model", ollama_models)
        st.success(f"Selected model: {selected_model}")
    else:
        st.warning("No Ollama models found. Try running: `ollama pull codellama:7b-instruct`")

    #st.write(f"You selected: {l}") real time interaction 


# ───── Main Panel: Right Side ─────
st.markdown(
    """
    <div style='text-align: center;'>
        <h1>Personal LLM Assistant</h1>
        <h3>💬 Ask me anything about your codebase or database</h3>
    </div>
    """,
    unsafe_allow_html=True
)


# Initialize message history if it doesn't exist
if "messages" not in st.session_state:
    st.session_state.messages = []

# ─── Chat-style prompt input ───
with st.form(key="chat_form", clear_on_submit=True):
    col1, col2 = st.columns([6, 1])
    with col1:
        user_input = st.text_input("Ask a question...", key="user_prompt", label_visibility="collapsed")
    with col2:
        submitted = st.form_submit_button("Send")

# If the user submitted a message
if submitted and user_input:
    schema_manager = st.session_state.schema_manager
    pipeline = st.session_state.pipeline
    collection = schema_manager.get_collection("sakila")

    with st.spinner("Generating SQL..."):
        response = generate_sql_response(user_input, pipeline, collection)

    # Add user message
    user_data = {"role": "user", "text": user_input}
    st.session_state.messages.append(user_data)

    # Generate assistant response (dummy for now)
    #response = generate_sql_response(user_input)
    #response = generate_response()
    ai_data = {"role": "assistant", "text": response}
    st.session_state.messages.append(ai_data)


grouped_messages = []
i = 0
while i < len(st.session_state.messages):
    pair = []
    if i < len(st.session_state.messages):
        pair.append(st.session_state.messages[i])
    if i + 1 < len(st.session_state.messages):
        pair.append(st.session_state.messages[i + 1])
    grouped_messages.append(pair)
    i += 2

# Display most recent pairs at the top
for pair in reversed(grouped_messages):
    for message in pair:
        with st.chat_message(message["role"]):
            if message["role"] == "assistant":
                st.code(message["text"], language="sql")
            else:
                st.markdown(message["text"])