# script for UI/user interaction 
import streamlit as st

# 1: selection box for selecting specific database files, or codebases etc 
# 2: maybe also display all the available files?

# To run: streamlit run app.py

st.set_page_config(page_title="Personal LLM Assistant", layout="centered")

st.title("Personal LLM Assistant")

db_files = ["hr", "sales", "movies"]
selected_db = st.selectbox("Select a database", db_files)