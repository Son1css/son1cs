import os
import shutil
with open("text_file.txt", "w") as f:
    f.write("Hello, Python!\nThis is line one.")
with open("text_file.txt", "r") as f:
    print(f.read())


