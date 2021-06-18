-- https://www.tutorialspoint.com/lua/lua_operators.htm

-- https://www.geeksforgeeks.org/what-is-the-difference-between-assignment-and-equal-to-operators/
-- The "=" is an assignment operator used to assign the value on the right to the variable on the left
a = 10
b = 20
jordan = "gay"

-- the "==" operator checks whether two given operands are equal or not. If true, return true. else false
5==5
c = 5
d = 10
e = c + d
if e == 15 then return true
--
--other comparative operators
not equal to ~=
less than <
greater than >
greater than or equal to =>
less than or equal to =<

--logical operators
and -- (are both of them true?)
or -- (if A or B is true)
not -- (reverses the logical state. If it was true, it's now false.)

--Misc operators
.. --concatenates two strings.
# --returns the length of a string or table. #"hello" will return 5

--Mathematical
--Additive
+ --adds
- --subtracts
--Multiplicative
* --multiply
/ --divide
% --Modulus. (the remainder after you divide)
--example of %
a = 21
b = 10
c = a % b
c = 2.1
-- (21 / 10 = ) ???
-- come back to this later
