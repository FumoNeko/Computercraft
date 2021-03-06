--[[ While loop. while loops go as long as a condition is true.
 If only the true condition is specified, a while loop will go on forever. So put your sleeps in unless you want to crash. ]]
while true do
  term.clear()
  term.setCursorPos(1, 1)

  local x = math.random(1, 10)

  print("your number is: "..x)
  sleep(2)
end
--

--if x is greater than 2, loop. Loop ends when x is no longer greater than 2.
x = 10
while x > 2 do
  term.clear()
  term.setCursorPos(1, 1)

  local x = math.random(1, 10)

  print("your number is: "..x)
  sleep(2)
end

print("end")
--

--[[ for loop. If you only want to do something a specific number of times.
-- for i = start, end do
-- i MUST be a number.
-- i counts up from 1 until it hits the end.
-- You can set a custom increment, such as for i = 2, 10, 2 do which will increment by 2, and loop 5 times. ]]
for i = 1, 5 do
  term.clear()
  term.setCursorPos(1, 1)
  local x = math.random(1, 10)
  print("your number is: "..x)
  print("we are on loop: "..i)
  sleep(2)
end

print("end")
--

--A while loop can also be used as a for loop with some variable funkery
i = 1
while i < 5 do
  term.clear()
  term.setCursorPos(1, 1)
  local x = math.random(1, 10)
  print("your number is: "..x)
  print("we are on loop: "..i)
  i = i + 1
end
--
--[[
Repeat loop. A repeat loop is similar to a while loop, where it will loop until a condition is met.

For example, if you want to loop until x = 5, you can do while x < 5 do CODE
if you want to use a repeat loop, do repeat CODE until x = 5

The fundamental difference between a while and a repeat loop is:
In a while loop, if a condition is met, it enters the loop and executes code.
In a repeat loop, it executes code inside the block until a stop condition is met. ]]
i = 1
repeat
  term.clear()
  term.setCursorPos(1, 1)
  local x = math.random(1, 10)
  print("your number is: "..x)
  print("we are on loop: "..i)
  i = i + 1
until i == 5

--Nested loops
-- You can put loops inside of other loops
for i = 1, 10 do -- loops the ENTIRE code 10 times
  for i = 1, 5 do -- loops this section 5 times
    turtle.dig()
    turtle.forward()
    turtle.digDown()
  end
end
-- In total, the code does 50 loops.
-- You can put other code in between to handle things that don't need to be looped, or do other loops. The code doesn't need to be doing the same thing either.
