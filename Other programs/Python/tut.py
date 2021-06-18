# -------------
# Comments
# -------------

# Comments use #
# There are no multi-line comments. You have to keep spamming #

# Technically there are multi-line strings. If they are not assigned to a variable, python ignores them
"""
This is
a multi-line
string
Technically it can be considered a comment if it is not assigned to any variables.
"""

# -------------
# Variables and data types
# -------------

# String
"string"
meat = "steak"
print("hello world")

# Number
1
myNumber = 1

# Data types are automatically assigned
meat = "steak"
meat = 1
# You will probably still need toNumber() and toString()
meat = "4"
toNumber(meat) # => meat = 4

# You can manually specify data types.
x = str(3)
y = int(3)
z = float(3)

# You can get data type with type()
print(type(z))

# You can assign many variables at once
x, y, z = "orange", "banana", "cherry"
print(x)
print(y)
print(z)

fruits = ["apple", "banana", "cherry"]
x, y, z = fruits
print(x)
print(y)
print(z)

# Or assign them all the same value
x = y = z = "Orange"

# Concatenation
x = "awesome"
print("Python is " + x)

x = "Python is "
y = "awesome"
z = x + y
print(z)

# You cannot combine strings and numbers. Use toString() and toNumber()
name = "John"
x = 5
x + name # => ERROR

# Math
x = 5
y = 10
print(x + y)

# You cannot manually define global and local variables. The status is assigned
# Depending on whether or not it is inside a function.
# Inside function = Local, Outside function = Global
globalvariable = 5
def foo():
    localvariable = "local"

# You can change global variables inside functions with keyword global
globalvariable = "awesome"
def myfunc():
    global x
    x = "fantastic"
myfunc()
print("Python is " + x)

# Data types

"""
Text Type:	str
Numeric Types:	int, float, complex
Sequence Types:	list, tuple, range
Mapping Type:	dict
Set Types:	set, frozenset
Boolean Type:	bool
Binary Types:	bytes, bytearray, memoryview

x = "Hello World"	                           str
x = 20	                                       int
x = 20.5	                                   float
x = 1j	                                       complex
x = ["apple", "banana", "cherry"]              list
x = ("apple", "banana", "cherry")	           tuple
x = range(6)	                               range
x = {"name" : "John", "age" : 36}	           dict
x = {"apple", "banana", "cherry"}              set
x = frozenset({"apple", "banana", "cherry"})   frozenset
x = True	                                   bool
x = b"Hello"	                               bytes
x = bytearray(5)	                           bytearray
x = memoryview(bytes(5))	                   memoryview
"""

# Integers have unlimited length.
yint = 35656222554887711

# math.random
import random
print(random.randrange(1, 10))

# length
len() # checks length of string
a = "hello"
len(a)
len("hello")

# check strings
txt = "The best things in life are free!"
print("free" in txt) # checks for the word "free" in variable txt

# split
a = "Hello, World!"
print(a.split(",")) # returns ['Hello', ' World!']

# -------------
# Loops
# -------------

# For Loop
for i in range(6):
    print(i) # => "0, 1, 2, 3, 4, 5"

for i in range (1, 6):
    print(i) # => "1, 2, 3, 4, 5"

# For loop with table
table = ["apple", "banana", "cherry"]
for i in fruits
    print(i)

# While Loop
i = 1
while i < 6:
  print(i)
  i += 1 # => "1, 2, 3, 4, 5"

# -------------
# Tables, Arrays, and Lists
# -------------

# Tables are sometimes called arrays for some reason.
# The tables we are familiar with are called "lists"

cars = ["Ford", "Volvo", "BMW"] # => New table called cars.

x = cars[0] # => x = "Ford"

cars[0] = "Toyota" # => Replaces "Ford" with "Toyota"

x = len(cars) # => returns number of elements in cars table

# -------------
# wildcard
# -------------

# -------------
# operators
# -------------

# arithmetic
+	Addition	      x + y
-	Subtraction	      x - y
*	Multiplication    x * y
/	Division          x / y
%	Modulus	          x % y
**	Exponentiation	  x ** y
//	Floor division    x // y

# assignment
=	  x = 5	        x = 5
+=	  x += 3	    x = x + 3
-=	  x -= 3	    x = x - 3
*=	  x *= 3	    x = x * 3
/=	  x /= 3	    x = x / 3
%=	  x %= 3	    x = x % 3
//=	  x //= 3	    x = x // 3
**=	  x **= 3	    x = x ** 3
&=	  x &= 3	    x = x & 3
|=	  x |= 3	    x = x | 3
^=	  x ^= 3	    x = x ^ 3
>>=	  x >>= 3	    x = x >> 3
<<=	  x <<= 3	    x = x << 3

# comparison
==	Equal	                    x == y
!=	Not equal	                x != y
>	Greater than	            x > y
<	Less than	                x < y
>=	Greater than or equal to	x >= y
<=	Less than or equal to    	x <= y

# logical
and 	Returns True if both statements are true	                x < 5 and  x < 10
or	    Returns True if one of the statements is true            	x < 5 or x < 4
not	    Reverse the result, returns False if the result is true	    not(x < 5 and x < 10)

# identity
Operator	Description	Example	Try it
is 	Returns True if both variables are the same object	x is y
is not	Returns True if both variables are not the same object	x is not y

# membership
in 	Returns True if a sequence with the specified value is present in the object	x in y
not in	Returns True if a sequence with the specified value is not present in the object	x not in y

# bitwise
& 	AND	Sets each bit to 1 if both bits are 1
|	OR	Sets each bit to 1 if one of two bits is 1
 ^	XOR	Sets each bit to 1 if only one of two bits is 1
~ 	NOT	Inverts all the bits
<<	Zero fill left shift	Shift left by pushing zeros in from the right and let the leftmost bits fall off
>>	Signed right shift	Shift right by pushing copies of the leftmost bit in from the left, and let the rightmost bits fall off

# -------------
# ifthenelse
# -------------

#ifthen
a = 33
b = 200
if b > a:
  print("b is greater than a")

#elseif
a = 33
b = 33
if b > a:
  print("b is greater than a")
elif a == b:
  print("a and b are equal")

#implicit else
a = 200
b = 33
if b > a:
  print("b is greater than a")
else:
  print("b is not greater than a")

#both elseif and else
a = 200
b = 33
if b > a:
  print("b is greater than a")
elif a == b:
  print("a and b are equal")
else:
  print("a is greater than b")

#and
a = 200
b = 33
c = 500
if a > b and c > a:
  print("Both conditions are True")

#or
a = 200
b = 33
c = 500
if a > b or a > c:
  print("At least one of the conditions is True")

#nested if
x = 41

if x > 10:
  print("Above ten,")
  if x > 20:
    print("and also above 20!")
  else:
    print("but not above 20.")

# -------------
# Functions
# -------------
# Whitespace is significant. A function ends when there is no longer an indentation.
def my_function():
    print("Hello from a function")
my_function() # => "Hello from a function"

#events
