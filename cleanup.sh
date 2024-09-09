#!/bin/bash
# Check if a filename is provided as an argument
if [ $# -eq 0 ]; then
  echo "Error: Please provide a filename as an argument."
  exit 1
fi
filename="$1"
# Execute the commands to process the file
cat "$filename" | perl -pe 's/\e([^\[\]]|\[.*?[a-zA-Z]|\].*?\a)//g' | col -b > "$filename-cleaned" 
echo "File processed successfully. Output saved to $filename-cleaned"
