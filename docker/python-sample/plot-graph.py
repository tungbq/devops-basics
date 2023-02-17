import matplotlib.pyplot as plt

# Create some data for the plot
x = [1, 2, 3, 4, 5]
y = [1, 4, 9, 16, 25]

# Plot the data
plt.plot(x, y)

# Add a title and axis labels
plt.title("Simple Plot")
plt.xlabel("X Axis")
plt.ylabel("Y Axis")

# Show the plot
plt.show()