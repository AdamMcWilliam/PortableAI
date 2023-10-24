#!/bin/bash

# Check if jq is installed and install it if not
if ! command -v jq &> /dev/null; then
  echo "jq is not installed. Installing..."
  if [ "$(uname)" == "Darwin" ]; then
    brew install jq
  elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    sudo apt-get update
    sudo apt-get install jq
  else
    echo "Unsupported OS. Please install jq manually."
    exit 1
  fi
fi

# Read the API key from a file and store it in the OPENAI_API_KEY variable
OPENAI_API_KEY=$(cat open-ai-key.txt)
PROMPT=$(cat prompt.txt)

# Initialize the conversation JSON with the system message
CONVERSATION_JSON='{
  "model": "gpt-3.5-turbo",
  "messages": [
    {
      "role": "system",
      "content": "'"$PROMPT"'"
    }
  ]
}'

# Start the conversation loop
while true; do
  # Read user input from the terminal
  echo "User:"
  read USER_MESSAGE

  # Append the user message to the conversation JSON
  CONVERSATION_JSON=$(jq -n --argjson data "$CONVERSATION_JSON" --arg role "user" --arg content "$USER_MESSAGE" '$data | .messages += [{role: $role, content: $content}]')

  # Make the API request using cURL
  echo $CONVERSATION_JSON > conversation.json
  curl -s https://api.openai.com/v1/chat/completions \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $OPENAI_API_KEY" \
    --data @conversation.json -o curl.txt

  # Extract and display the assistant's reply
  ASSISTANT_REPLY=$(cat curl.txt | jq -r '.choices[0].message.content')
  echo "AI:"
  echo "$ASSISTANT_REPLY"
done
