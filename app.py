# script for UI/user interaction 
from scripts.rag.retriever import Retriever
from scripts.managers.sql_manager import SQLSchemaManager
import streamlit as st
import random
import string

# Function to simulate assistant response (long text)
def generate_response(user_message):
    return ''.join(random.choices(string.ascii_letters + string.whitespace, k=1000))

# testing retriever 
def generate_sql_response(user_message):
    manager = SQLSchemaManager()
    collection = manager.get_collection("sakila")

    retriever = Retriever(collection)
    context_chunks = retriever.retrieve_context(user_message)
    for i, chunk in enumerate(context_chunks, 1):
        print(f"Chunks {i}:\n{chunk}\n")
    return 


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
        load_doc = st.selectbox("Select Document", ["sakila", "chinook", "custom.db"])
        load_submitted = st.form_submit_button("Load")
        if load_submitted:
            st.success(f"Loaded document: {load_doc}")

    st.markdown("---")  # Optional divider

    # ───── Section 2: Other Options ─────
    #st.selectbox("Available Collections", ["sakila", "chinook", "custom.db"])
    collection = st.selectbox("Select Collection", ["sakila", "chinook", "custom.db"])
    model = st.selectbox("Select Model", ["sakila", "chinook", "custom.db"])
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
    generate_sql_response(user_input)
    # Add user message
    user_data = {"role": "user", "text": user_input}
    st.session_state.messages.append(user_data)

    # Generate assistant response (dummy for now)
    response = generate_response(user_input)
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
            st.markdown(message["text"])