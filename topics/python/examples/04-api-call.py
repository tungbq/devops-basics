import requests
from requests.exceptions import RequestException

def print_advise():
    """
    This function prints a random advice by calling the `adviceslip` endpoint
    """
    url = "https://api.adviceslip.com/advice"
    try:
        # Call the api endpoint, skip the SSL verification
        response = requests.get(url, verify=False)

        # Raise an exception for HTTP errors
        response.raise_for_status()

        # Get the data from respose
        advice_data = response.json()

        # Print the advice
        print("Random Advice:", advice_data["slip"]["advice"])
    except RequestException as e:
        # Print the error and status code if any error occurred
        print(f"Error: {e}")
        if hasattr(e, "response") and e.response:
            print(f"Status Code: {e.response.status_code}")


if __name__ == "__main__":
    print_advise()
