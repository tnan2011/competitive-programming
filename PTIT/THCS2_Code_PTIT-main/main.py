import os
from unidecode import unidecode
import string

def convert_to_slug(text):
    text = unidecode(text)
    text = text.lower()
    text = text.replace(" ", "-")
    return string.capwords(text, '-').replace("-", "")

folder_path = r"C:\Users\HP Pavilion\Desktop\Tai_Lieu_cpp\THCS2_Code_PTIT-main"

for filename in os.listdir(folder_path):
    if filename.startswith("C"):
        parts = filename.split("-")
        if len(parts) >= 2:
            new_filename = convert_to_slug(parts[1]) + ".cpp"
            new_filename = parts[0] + "-" + new_filename
            os.rename(os.path.join(folder_path, filename), os.path.join(folder_path, new_filename))
        else:
            print(f"Bỏ qua file {filename} (Cấu trúc không đúng)")