-- Summation function
function sum(t)
  local sum = 0
  for k, v in pairs(t) do
    sum = sum + v
  end

  return sum
end

-- Comma value function
function comma_value(n)
  local left, num, right = string.match(n, '^([^%d]*%d)(%d*)(.-)$')
  return left..(num:reverse():gsub('(%d%d%d)', '%1,'):reverse())..right
end

-- Center text function
function centerWrite(text)
  local width, height = term.getSize()
  local x, y = term.getCursorPos()
  term.setCursorPos(math.ceil((width / 2) - (text:len() / 2)), y)
  term.write(text)
end

-- DBC TP cost calculator
term.clear()
term.setCursorPos(1, 1)
centerWrite("DBC TOTAL TP COST CALCULATOR")

tpTable = {}
write("\nEnter your tp cost ")
currentTpCost = read()
currentTpCost = tonumber(currentTpCost)
tpTable[1] = currentTpCost
write("How many attributes? ")
levelUps = read()
levelUps = tonumber(levelUps)
levelUps = levelUps + 2

if currentTpCost == 16 then
  for i = 2, levelUps do
    if i < 19 then
      currentTpCost = currentTpCost + 0
      tpTable[i] = currentTpCost
    elseif i == 19 then
      currentTpCost = currentTpCost + 5
      tpTable[i] = currentTpCost
    elseif i > 19 and i < 137 then
      currentTpCost = currentTpCost + 7
      tpTable[i] = currentTpCost
    elseif i >= 137 then
      currentTpCost = currentTpCost + 6
      tpTable[i] = currentTpCost
    end
  end

elseif currentTpCost >= 21 and currentTpCost < 840 then
  iOne = 2
  repeat
    currentTpCost = currentTpCost + 7
    tpTable[iOne] = currentTpCost
    iOne = iOne + 1
    levelUps = levelUps - 1
  until currentTpCost >= 840 or levelUps <= 0
  if currentTpCost >= 840 and levelUps > 0 then
    for i = iOne, levelUps do
      currentTpCost = currentTpCost + 6
      tpTable[i] = currentTpCost
    end
  end


elseif currentTpCost >= 840 then
  for i = 2, levelUps do
    currentTpCost = currentTpCost + 6
    tpTable[i] = currentTpCost
  end
end


total = sum(tpTable)
print("Total TP Cost: "..comma_value(total))
print("Next Level Up: "..comma_value(currentTpCost))
