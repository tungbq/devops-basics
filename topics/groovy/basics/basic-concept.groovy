// Function to print log messages in green color
def consoleLog(message) {
    println "\u001B[32m[INFO] $message\u001B[0m"
}

// Greetings!
consoleLog("Welcome to Groovy!")

//------------------------
// Working with variables
//------------------------

def myName = "Tung"
def myAge = 28
println "${myName} is ${myAge} years old!"

//-------------------
// Working with if-else
//-------------------

consoleLog("Working with if-else")

def number = 10

if (number > 5) {
    println("The number is greater than 5.")
} else {
    println("The number is not greater than 5.")
}

//-----------------------
// Working with switch-case
//-----------------------

consoleLog("Working with switch-case")

def myFruit = "Banana"

switch (myFruit) {
    case "Apple":
        println("It's an apple.")
        break
    case "Banana":
        println("It's a banana.")
        break
    case "Cherry":
        println("It's a cherry.")
        break
    default:
        println("It's something else.")
}

//--------------------
// Working with for loop
//--------------------

consoleLog("Working with for loop")

def fruits = ["Apple", "Banana", "Cherry", "Watermelon", "Elderberry"]

for (fruit in fruits) {
    println("I like $fruit")
}

//----------------------
// Working with functions
//----------------------

consoleLog("Working with functions")

def factorial(n) {
    if (n == 0) {
        return 1
    } else {
        return n * factorial(n - 1)
    }
}

// Call the function and store the result in a variable
def result = factorial(5)

// Print the result
println("Factorial of 5 is: $result")

//-----------------------
// Working with Map in Groovy
//-----------------------

consoleLog("Working with Map in Groovy")

// Create a map with key-value pairs
def person = [
    "firstName": "John",
    "lastName": "Doe",
    "age": 30,
    "city": "New York"
]

// Access values in the map
def firstName = person["firstName"]
def age = person["age"]

// Modify values in the map
person["city"] = "Los Angeles"

// Add a new key-value pair to the map
person["email"] = "john.doe@example.com"

// Iterate over the map
person.each { key, value ->
    println("$key: $value")
}

//--------------------
// Working with try-catch
//--------------------

consoleLog("Working with try-catch")

def divideNumbers(int dividend, int divisor) {
    try {
        def result = dividend / divisor
        return result
    } catch (ArithmeticException e) {
        println("An arithmetic exception occurred: ${e.message}")
    } finally {
        println("Finally block executed.")
    }
}

// Example usage:
try {
    def divideResult = divideNumbers(10, 2)
    println("Result: $divideResult")
} catch (Exception e) {
    println("An exception occurred: ${e.message}")
}

//--------------------
// Working with while loop
//--------------------

consoleLog("Working with while loop")

def counter = 0
while (counter < 10) {
  println("The counter is $counter")
  counter++
}

//--------------------
// Working with sleep
//--------------------

consoleLog("Working with sleep")

println("Sleeping for 30 seconds...")
sleep(30000) // Sleep for 30 seconds
println("Woke up after 30 seconds!")
