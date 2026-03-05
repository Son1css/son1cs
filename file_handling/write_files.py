import os 
import shutil

with open("text_file.txt", "a") as f:
    f.write("\nThis is appended line.")

shutil.copy("text_file.txt", "backup_file.txt")