-- should put presets for each multi so the number is lower and more readable
-- have preset multis and a raw input option
function getDefense()
  write("What is your dex? ")
  local dex = read()
  local numDex = tonumber(dex)
  local defense = numDex * 3.6
  local passiveDefense = defense * 0.348
  print("Dex: "..numDex)
  print("Defense: "..defense)
  print("Passive Defense: "..passiveDefense)
end

function getDexByDefense()
  write("What is your defense? ")
  local defense = read()
  local numDefense = tonumber(defense)
  local dex = numDefense / 3.6
  local passiveDefense = numDefense * 0.348
  print("Dex: "..dex)
  print("Defense: "..numDefense)
  print("Passive Defense: "..passiveDefense)
end

function getDexByPDef()
  write("What is your passive defense? ")
  local passiveDefense = read()
  local numPassiveDefense = tonumber(passiveDefense)
  local defense = numPassiveDefense / 0.348
  local dex = defense / 3.6
  print("Dex: "..dex)
  print("Defense: "..defense)
  print("Passive Defense: "..numPassiveDefense)
end

print("What are you calculating?\n1. Get Defense by Dex\n2. Get Dex by Defense\n3. Get Dex by Passive Defense")
write("Enter option: ")
local stringOption = read()
local option = tonumber(stringOption)
if option == 1 then
  getDefense()
elseif option == 2 then
  getDexByDefense()
elseif option == 3 then
  getDexByPDef()
else error("That's not an option loser.")
end
