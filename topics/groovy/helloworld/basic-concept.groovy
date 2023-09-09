// Greetings!
println "Welcome to groovy!"

// Working with variables
myName = "Tung"
myAge = 28
println "${myName} is ${myAge} years old!"

// Working with if else
def number = 10

if (number > 5) {
    println("The number is greater than 5.")
} else {
    println("The number is not greater than 5.")
}

// Working with switch case
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

// Working with for loop
def fruits = ["Apple", "Banana", "Cherry", "Watermelon", "Elderberry"]

for (fruit in fruits) {
    println("I like $fruit")
}

// Working with function
def factorial(n) {
    if (n == 0) {
        return 1
    } else {
        return n * factorial(n - 1)
    }
}
//-- Call the function and store the result in a variable
def result = factorial(5)
//-- Print the result
println("Factorial of 5 is: $result")

