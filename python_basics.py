#Home 
print("Hello, World!")
#Getting started
import sys

print(sys.version)
#Comments 

#this is comment 
x= 1

x=2 #this is comment

x=3 #print("this is comment also")

x=4
#This is a comment
#written in
#more than just one line

x=5
"""
This is a comment
written in
more than just one line

"""
#Syntax

x = 5
y = "Hello, World!"

#This is a comment.
print("Hello, World!")

if 5 > 2:
 print("Five is greater than two!") 
if 5 > 2:
        print("Five is greater than two!") 
        
if 5 > 2:
  print("Five is greater than two!")
  
#variable

x = 5
y = "John"
print(x)
print(y)

x = 4       # x is of type int
x = "Sally" # x is now of type str
print(x)

x = str(3)    # x will be '3'
y = int(3)    # y will be 3
z = float(3)  # z will be 3.0

x = 5
y = "John"
print(type(x))
print(type(y))

x = "John"
# is the same as
x = 'John'

a = 4
A = "Sally"
#A will not overwrite a

#Data Types
x = "Hello World"
#display x:
print(x)
#display the data type of x:
print(type(x)) 

x = 20
#display x:
print(x)
#display the data type of x:
print(type(x)) 

x = 20.5
#display x:
print(x)
#display the data type of x:
print(type(x)) 

x = 1j
#display x:
print(x)
#display the data type of x:
print(type(x)) 

x = ["apple", "banana", "cherry"]
#display x:
print(x)
#display the data type of x:
print(type(x)) 

#Numbers
x = 1    # int
y = 2.8  # float
z = 1j   # complex
print(type(x))
print(type(y))
print(type(z))

x = 1
y = 35656222554887711
z = -3255522
print(type(x))
print(type(y))
print(type(z))

x = 1.10
y = 1.0
z = -35.59
print(type(x))
print(type(y))
print(type(z))

x = 35e3
y = 12E4
z = -87.7e100
print(type(x))
print(type(y))
print(type(z))

x = 3+5j
y = 5j
z = -5j
print(type(x))
print(type(y))
print(type(z))

x = 1    # int
y = 2.8  # float
z = 1j   # complex
#convert from int to float:
a = float(x)
#convert from float to int:
b = int(y)
#convert from int to complex:
c = complex(x)
print(a)
print(b)
print(c)
print(type(a))
print(type(b))
print(type(c))

import random
print(random.randrange(1, 10))

#casting

x = int(1)   # x will be 1
y = int(2.8) # y will be 2
z = int("3") # z will be 3

x = float(1)     # x will be 1.0
y = float(2.8)   # y will be 2.8
z = float("3")   # z will be 3.0
w = float("4.2") # w will be 4.2

x = str("s1") # x will be 's1'
y = str(2)    # y will be '2'
z = str(3.0)  # z will be '3.0'

#string

txt = "The best things in life are free!"
if "free" in txt:
  print("Yes, 'free' is present.")
  
txt = "The best things in life are free!"
if "expensive" not in txt:
  print("No, 'expensive' is NOT present.")

b = "Hello, World!"
print(b[-5:-2])

a = "Hello, World!"
print(a.split(",")) # returns ['Hello', ' World!']
a = "Hello, World!"
print(a.replace("H", "J"))
a = " Hello, World! "
print(a.strip()) # returns "Hello, World!"
a = "Hello, World!"
print(a.lower())

a = "Hello"
b = "World"
c = a + " " + b
print(c)

price = 59
txt = f"The price is {price} dollars"
print(txt)
txt = "We are the so-called \"Vikings\" from the north."