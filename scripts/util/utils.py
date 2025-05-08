import subprocess
from pathlib import Path

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
        print(f"Error retrieving Ollama models: {e}")
        return []


# Go into data folder and grab documentss
def get_documents():
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