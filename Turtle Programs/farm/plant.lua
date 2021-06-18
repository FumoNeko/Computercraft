-- a script for a turtle named ThatHoeOverThere

for i = 1, 11 do -- loops the entire code 11 times, There are 2 main loops, which equals 22, which is the width of the farm
-- loop 1
-- loops the actions "place down" and "forward" 31 times to facilitate planting seeds in a straight line, where 31 is the length of the farm.
    for i = 1, 31 do
      turtle.placeDown()
      turtle.forward()
    end
-- turn 1
-- this part turns the turtle after it is done with one row so that it can begin on the next row.
  turtle.turnLeft()
  turtle.forward()
  turtle.turnLeft()
-- loop 2
-- this loop is the same but is required so that the turtle can turn.
    for i = 1, 31 do
      turtle.placeDown()
      turtle.forward()
    end
-- turn 2
  turtle.turnRight()
  turtle.forward()
  turtle.turnRight()
end -- end of the program, this part ends the for loop at the very beginning of the program. There is no more code, so the program ends.

--[[
Developer notes
The program runs longer than expected. Is this because I did 2 loops? If so, cutting the initial loop value in half to 11 should fix this. Though it seems strange, seeing as that would limit farms to even numbers, and how there are programs that allow the user to define the length and width. Is there a more efficient way to write this code?
--]]
