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
  centerWrite("DBC TP EVAL COST CALCULATOR")

  tpTable = {}
  write("\nEnter your tp cost ")
  currentTpCost = read()
  tpTable[1] = currentTpCost
  write("How much TP do you have? ")
  tpEval = read()
  numTpEval = tonumber(tpEval)
  a = 1
  i = 2
  repeat
    numTpTable = tonumber(tpTable[a])
    currentTpCost = currentTpCost + 60
    tpTable[i] = currentTpCost
    total = sum(tpTable)
    numTotal = tonumber(total)
    i = i + 1
    a = a + 1
    sleep(0)
  until numTotal >= numTpEval
    i = i - 1
    print("Total TP Cost: "..comma_value(total))
    print("Attributes Obtainable: "..i)
