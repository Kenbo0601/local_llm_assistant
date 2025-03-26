import unittest
import sqlite3
import os
from pathlib import Path
from scripts.managers.sql_manager import SQLSchemaManager

class TestSQLSchemaManager(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        # Set up paths
        cls.project_root = Path(__file__).resolve().parents[1]
        cls.db_dir = cls.project_root / "data" / "db"
        cls.db_dir.mkdir(parents=True, exist_ok=True)
        cls.test_db_path = cls.db_dir / "test.db"

        # Create a sample SQLite DB for testing
        conn = sqlite3.connect(cls.test_db_path)
        cursor = conn.cursor()
        cursor.execute("""
            CREATE TABLE IF NOT EXISTS employee (
                id INTEGER PRIMARY KEY,
                name TEXT,
                department TEXT
            );
        """)
        conn.commit()
        conn.close()

        cls.manager = SQLSchemaManager()

    def test_load_schema_returns_expected_structure(self):
        schema_docs = self.manager.load_schema("test.db")

        self.assertIsInstance(schema_docs, list)
        self.assertGreater(len(schema_docs), 0)

        for doc in schema_docs:
            self.assertIn("text", doc)
            self.assertIn("table", doc)
            self.assertIn("columns", doc)
            self.assertIsInstance(doc["columns"], list)

    def test_schema_includes_employee_table(self):
        schema_docs = self.manager.load_schema("test.db")
        tables = [doc["table"] for doc in schema_docs]
        self.assertIn("employee", tables)

    def test_columns_are_correct(self):
        schema_docs = self.manager.load_schema("test.db")
        for doc in schema_docs:
            if doc["table"] == "employee":
                self.assertIn("id (PK)", doc["columns"])
                self.assertIn("name", doc["columns"])
                self.assertIn("department", doc["columns"])

    @classmethod
    def tearDownClass(cls):
        os.remove(cls.test_db_path)

if __name__ == "__main__":
    unittest.main()
