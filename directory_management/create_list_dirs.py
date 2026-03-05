import os
os.makedirs("parent/child/grandchild", exist_ok=True)

files = os.listdir('.')
py_files= [f for f in files if f.endswith('.py')]
print(f"Python files: {py_files}")