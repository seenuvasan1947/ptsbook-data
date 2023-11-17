import os
import shutil

folders = ['ta-IN', 'ar', 'bg-BG', 'bn-IN', 'bs-BA', 'ca-ES', 'cs-CZ', 'cy-GB', 'da-DK', 'de-DE', 'el-GR', 'en-GB',
           'en-IN', 'en-US', 'es-ES', 'et-EE', 'fi-FI', 'fil-PH', 'fr-FR', 'gu-IN', 'he-IL', 'hi-IN', 'hr-HR', 'hu-HU',
           'id-ID', 'is-IS', 'it-IT', 'ja-JP', 'jv-ID', 'km-KH', 'kn-IN', 'ko-KR', 'lv-LV', 'lt-LT', 'ml-IN', 'mr-IN',
           'ms-MY', 'nb-NO', 'ne-NP', 'nl-NL', 'pt-BR', 'pt-PT', 'pl-PL', 'pa-IN', 'ro-RO', 'ru-RU', 'si-LK', 'sk-SK',
           'sq-AL', 'sr', 'su-ID', 'sv-SE', 'sw-KE', 'te-IN', 'th-TH', 'tr-TR', 'uk-UA', 'ur-PK', 'vi-VN', 'zh-CN']

def create_folders_and_copy():
    # Create folders
    for folder in folders:
        os.makedirs(folder, exist_ok=True)

    # Get the number of episodes from the user
    num_episodes = int(input("Enter the number of episodes: "))

    # Create episode files in each folder
    for folder in folders:
        for i in range(1, num_episodes + 1):
            open(f"{folder}/{i}.txt", 'w').close()

    # Get the input folder path from the user
    input_folder = input("Enter the path of the input folder: ")

    # Copy and paste content to each file
    for folder in folders:
        for i in range(1, num_episodes + 1):
            with open(f"{input_folder}/{i}.txt", 'r') as input_file:
                content = input_file.read()
            with open(f"{folder}/{i}.txt", 'w') as output_file:
                output_file.write(content)

    print("Process completed.")

def copy_extra_files():
    input_folder = input("Enter the path of the input folder: ")

    for folder in folders:
        for file_name in os.listdir(input_folder):
            source_file = os.path.join(input_folder, file_name)
            if os.path.isfile(source_file):
                shutil.copy(source_file, folder)

    print("Process completed.")

# Ask the user for choice
print("0-create new 1-for add extra files")
choice = input("Choose an option (0 or 1): ")

if choice == "0":
    create_folders_and_copy()
elif choice == "1":
    copy_extra_files()
else:
    print("Invalid choice.")

