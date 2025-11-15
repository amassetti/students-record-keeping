from functools import reduce

def multiply (*numbers):
    print(numbers)
    if not numbers:
        return 0
    
    total = 1
    for number in numbers:
        total *= number

    return total

def sum (*numbers):
    if not numbers:
        return 0
    
    return reduce(lambda x, y: x + y, numbers)

def get_first_and_last(numbers: list):
    # List unpacking
    first, *others, last = numbers
    return (first, others, last)

print(f"multiply = {multiply(1, 2, 3, 4, 5)}")
print(f"multiply = {multiply()}")

numbers = [1, 2, 3, 4, 5, 6, 7, 8]
first, others, last = get_first_and_last(numbers)
print(f"First: {first}, Last: {last}, Others: {others}")


"""
Lambdas

lambda parameters:expression

"""

def get_prices(items: list):
    # with lambda
    # return list(map( lambda item: item[1], items))
    # with list comprehension
    return [item[1] for item in items]

def get_prices_over(price: int, items: list):
    # with lambda
    # return list(filter( lambda item: item[1] >= price, items))
    # with list comprehension
    return [item for item in items if item[1] >= price]

items = [
    ("Product1", 10),
    ("Product2", 20),
    ("Product3", 30),
    ("Product4", 40),
    ("Product5", 50),
    ("Product6", 60),
]

print(get_prices(items))
print(get_prices_over(40, items))

"""
List comprehension
[expression for item in items]
[expression for item in items if boolean_expression]


Set comprehension
{expression for item in items}

Dictionary comprehension
{key:expression for item in items}

"""

values = [x * 2 for x in range(5)] # [0, 2, 4, 6, 8]


""" 
Generators don't store all the values in memory, they generate a new value in each iteration
(expression for item in items)
"""

from sys import getsizeof

SIZE=10
generator_values = (x*2 for x in range(SIZE))
in_memory_values = [x*2 for x in range(SIZE)]

print(f"Size of generator: {getsizeof(generator_values)} for {SIZE} elements")
print(f"Size of in memory values: {getsizeof(in_memory_values)} for {SIZE} elements")

"""
Unpacking operator *
"""

some_numbers = [2, 3, 10, 1]

print(f"Adding {some_numbers} to {sum(*some_numbers)}")
list_1 = [1, 2, 3, 4]
list_2 = [5, 6, 7, 8]
print(f"Combining list {list_1} and {list_2}: {[*list_1, *list_2]}")
dict_1 = {
    "first_name": "Pepe",
    "age": 22
}

dict_2 = {
    "last_name": "Lui",
    "address": "73 shanta"
}

print(f"Combining dictionary {dict_1} and {dict_2}: { {**dict_1, **dict_2} }")

