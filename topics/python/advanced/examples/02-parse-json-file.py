import json

# Read the JSON file
with open('sample_files/persional_info.json') as json_file:
    info = json.load(json_file)

# Display the parsed JSON data
print("Name:", info['name'])
print("Age:", info['age'])
print("Email:", info['email'])
print("Address:")
print("Street:", info['address']['street'])
print("City:", info['address']['city'])
print("Zipcode:", info['address']['zipcode'])
print("Interests:", ', '.join(info['interests']))
