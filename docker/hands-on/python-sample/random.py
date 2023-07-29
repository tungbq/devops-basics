import numpy as np

# Create an array of random numbers
data = np.random.rand(10)

# Sort the array in descending order
data = np.sort(data)[::-1]

# Print out the sorted array
print(data)
