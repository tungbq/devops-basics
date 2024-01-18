class Animal:
    def __init__(self, species, sound):
        self.species = species
        self.sound = sound
    
    def make_sound(self):
        return f"The {self.species} makes a {self.sound} sound."


class Dog(Animal):
    def __init__(self, name):
        super().__init__('dog', 'bark')
        self.name = name
    
    def wag_tail(self):
        return f"{self.name} wags its tail happily."


class Cat(Animal):
    def __init__(self, name):
        super().__init__('cat', 'meow')
        self.name = name
    
    def purr(self):
        return f"{self.name} purrs softly while being pet."


# Creating instances of animals
dog = Dog('Buddy')
cat = Cat('Whiskers')

# Using methods of the instances
print(dog.make_sound())  # Output: "The dog makes a bark sound."
print(dog.wag_tail())   # Output: "Buddy wags its tail happily."

print(cat.make_sound())  # Output: "The cat makes a meow sound."
print(cat.purr())       # Output: "Whiskers purrs softly while being pet."
