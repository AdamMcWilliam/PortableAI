# OpenAI Chatbot Project Setup

This repository contains a simple script for interacting with an OpenAI GPT-3.5 Turbo chatbot. To use this script, you need to set up two text files: `open-ai-key.txt` and `prompt.txt`. Follow the steps below to set up these files and get started.

## Setup Instructions

### 1. `open-ai-key.txt`

You will need an OpenAI API key to access the GPT-3.5 Turbo model. If you don't have one, sign up for an API key on the [OpenAI platform](https://platform.openai.com/signup).

Once you have your API key, create a text file named `open-ai-key.txt` in the project directory and paste your API key into this file. The content of `open-ai-key.txt` should look like:

your_api_key_here


Make sure to replace `your_api_key_here` with your actual OpenAI API key.

### 2. `prompt.txt`

The `prompt.txt` file contains the initial chat message for the chatbot. You can customize the chat prompt as per your requirements. This file should contain a single string that defines the chat conversation. For example:

You are a professional python programmer answer my questions as such


You can modify the content of `prompt.txt` to provide a starting message that suits your project's needs.

## Running the Script

With the `open-ai-key.txt` and `prompt.txt` files set up, you can run the script that interacts with the OpenAI chatbot. The script will send the chat prompt defined in `prompt.txt` and display the responses from the chatbot.

To run the script, open a terminal, navigate to the project directory, and execute the script:

```bash
./curl.sh
```
For windows you can edit the drive Letter in RunCurl.bat and run it


