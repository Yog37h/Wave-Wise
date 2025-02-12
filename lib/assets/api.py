import requests

# Model APIs hosted on ngrok
model_api1 = 'http://127.0.0.1:4040                     /model1'
model_api2 = 'http://127.0.0.1:4040                     /model2'
model_api3 = 'http://127.0.0.1:4040                     /model3'

# ThingSpeak APIs
api_key = 'R88BKBFCBQ68AC4B'
thing_speak_api1 = f'https://api.thingspeak.com/channels/2678874/fields/1.json?api_key={api_key}'
thing_speak_api2 = f'https://api.thingspeak.com/channels/2678874/fields/2.json?api_key={api_key}'

def fetch_model_data(url):
    response = requests.get(url)
    if response.status_code == 200:
        return response.json()
    else:
        return f"Failed to fetch data from {url}"

# Example function calls
print(fetch_model_data(model_api1))
print(fetch_model_data(thing_speak_api1))
