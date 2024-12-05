import requests
import os
# from dotenv import load_dotenv

# Load environment variables from .env file
# load_dotenv()

# Fetch the OAuth token from the .env file
# OAUTH_TOKEN = os.getenv('OAUTH_TOKEN_TESTING')
# OAUTH_TOKEN = os.getenv('OAUTH_TOKEN_PROD')

# Replace with your actual event ID and OAuth token
# event_id = "1105989306789"
# event_id = os.getenv('REFERENCE_EVENT_ID_RPAMAKER')
# event_id = os.getenv('REFERENCE_EVENT_ID_CPA')

def copy_event(event_id, OAUTH_TOKEN):
    # Define the URL and headers
    url = f"https://www.eventbriteapi.com/v3/events/{event_id}/copy/"
    headers = {
        "Authorization": f"Bearer {OAUTH_TOKEN}"
    }

    # Make the POST request
    response = requests.post(url, headers=headers)

    # Print the response
    if response.status_code == 200:
        print("Event copied successfully!")
        print(response.json())
    else:
        print(f"Failed to copy the event. Status code: {response.status_code}")
        print(response.text)