# Example Python Script: Factorial Calculator

# Function to calculate factorial
def calculate_factorial(number):
    result = 1
    for i in range(1, number + 1):
        result *= i
    return result

# Function to get user input and validate
def get_valid_input():
    while True:
        try:
            user_input = int(input("Enter a positive integer: "))
            if user_input > 0:
                return user_input
            else:
                print("Please enter a positive integer.")
        except ValueError:
            print("Invalid input. Please enter a valid integer.")

# Main program
print("Factorial Calculator")

# Get user input
number = get_valid_input()

# Calculate and display the factorial
result = calculate_factorial(number)
print(f"The factorial of {number} is: {result}")
