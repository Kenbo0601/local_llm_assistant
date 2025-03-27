# script for UI/user interaction 
import streamlit as st

# 1: selection box for selecting specific database files, or codebases etc 
# 2: maybe also display all the available files?

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
# Set up session state to hold chat history
if "chat_history" not in st.session_state:
    st.session_state["chat_history"] = []

st.markdown(
    """
    <div style='text-align: center;'>
        <h1>Personal LLM Assistant</h1>
        <h3>💬 Ask me anything about your codebase or database</h3>
    </div>
    """,
    unsafe_allow_html=True
)

# ─── Chat-style prompt input ───
# Input form with "Send" button
with st.form(key="chat_form", clear_on_submit=True):
    col1, col2 = st.columns([6, 1])  # Adjust widths as needed
    with col1:
        user_input = st.text_input("Ask a question...", key="user_prompt", label_visibility="collapsed")
    with col2:
        submitted = st.form_submit_button("Send")
