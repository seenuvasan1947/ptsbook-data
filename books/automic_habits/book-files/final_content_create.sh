#!/bin/bash


folders=( 'ta-IN'  
 'ar'  
 'bg-BG'  
 'bn-IN'  
 'bs-BA'  
 'ca-ES'  
 'cs-CZ'  
 'cy-GB'  
 'da-DK'  
 'de-DE'  
 'el-GR'  
 'en-GB'  
 'en-IN'  
 'en-US'  
 'es-ES'  
 'et-EE'  
 'fi-FI'  
 'fil-PH'  
 'fr-FR'  
 'gu-IN'  
 'he-IL'  
 'hi-IN'  
 'hr-HR'  
 'hu-HU'  
 'id-ID'  
 'is-IS'  
 'it-IT'  
 'ja-JP'  
 'jv-ID'  
 'km-KH'  
 'kn-IN'  
 'ko-KR'  
 'lv-LV'  
 'lt-LT'  
 'ml-IN'  
 'mr-IN'  
 'ms-MY'  
 'nb-NO'  
 'ne-NP'  
 'nl-NL'  
 'pt-BR'  
 'pt-PT'  
 'pl-PL'  
 'pa-IN'  
 'ro-RO'  
 'ru-RU'  
 'si-LK'  
 'sk-SK'  
 'sq-AL'  
 'sr'  
 'su-ID'  
 'sv-SE'  
 'sw-KE'  
 'te-IN'  
 'th-TH'  
 'tr-TR'  
 'uk-UA'  
 'ur-PK'  
 'vi-VN'  
 'zh-CN'  )

# Function to create folders and copy content
create_folders_and_copy() {
    # List of folder names
    #folders=('abc' 'xyz' 'mno')

    # Create folders
    for folder in "${folders[@]}"; do
        mkdir "$folder"
    done

    # Get number of episodes from the user
    read -p "Enter the number of episodes: " num_episodes

    # Create episode files in each folder
    for folder in "${folders[@]}"; do
        for ((i = 1; i <= num_episodes; i++)); do
            touch "$folder/$i.txt"
        done
    done

    # Get input folder name from user
    read -p "Enter the path of the input folder: " input_folder

    # Copy and paste content to each file
    for folder in "${folders[@]}"; do
        for ((i = 1; i <= num_episodes; i++)); do
            content=$(cat "$input_folder/$i.txt")
            echo "$content" > "$folder/$i.txt"
        done
    done

    echo "Process completed."
}

# Function to copy extra files
copy_extra_files() {
    read -p "Enter the path of the input folder: " input_folder
    for folder in "${folders[@]}"; do
        for file in "$input_folder"/*; do
            cp "$file" "$folder/"
        done
    done

    echo "Process completed."
}


# Ask user for choice
echo "0-create new 1-for add extra files"
read -p "Choose an option (0 or 1): " choice

case $choice in
    0)
        create_folders_and_copy
        ;;
    1)
        copy_extra_files
        ;;
    *)
        echo "Invalid choice."
        ;;
esac

