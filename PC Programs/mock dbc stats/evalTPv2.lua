-- enter tp amount you have
write("Enter your TP amount: ")
tpOwned = read()
numTpOwned = tonumber(tpOwned)
write("Enter your TP cost: ")
currentTpCost = read()
numCurrentTpCost = tonumber(currentTpCost)
if numCurrentTpCost < 3520 then
  error("Enter a number thats 3520 or greater")
end
i = 1
if numCurrentTpCost == 3520 and numTpOwned == 3520 then
  print("Attributes Obtainable: "..i)
else
  numTpOwned = numTpOwned - numCurrentTpCost
  --program subtracts each level up from amount punched in
  repeat
    numCurrentTpCost = numCurrentTpCost + 60
    numTpOwned = numTpOwned - numCurrentTpCost
    i = i + 1
  until numTpOwned <= 0
  print("Attributes obtainable: "..i)
end
-- 3520 - numTpOwned = numTpOwned
--3,520-(tp entered)=(ntp entered) 1 loop= 1 levels worth of tp
--3,580-(ntp entered)=(nntp entered) 2 + 2 levels worth of tp
