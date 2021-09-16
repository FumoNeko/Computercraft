---@diagnostic disable: undefined-field
--[[ API check
if fs.exists("event") == false then shell.run("pastebin get UKPy4iiE event") end
if os.loadAPI("event") == false then error("Failed to load event API") end

if fs.exists("data") == false then shell.run("pastebin get LnvzL7ur data") end
if os.loadAPI("data") == false then error("Failed to load data API") end

if fs.exists("utils") == false then shell.run("pastebin get dyvydHtK utils") end
if os.loadAPI("utils") == false then error("Failed to load utils API") end
]]

-- initialization
peripheral.wrap("back")
peripheral.wrap("monitor_7")
peripheral.wrap("opernperipheral_bridge_0")
peripheral.wrap("down")
local page = 1

-- functions
local function search(searchTerm)
  for i = 0, 190 do
    local c = peripheral.wrap("tile_thermalexpansion_cache_resonant_name_"..tostring(i))
    local data = c.getStoredItems()
    local data2 = c.getMaxStoredItems()
    --  print(data["display_name"])
    local qry = string.find(data["display_name"], searchTerm)
    if qry ~= nil then
      print(data["display_name"])
      print(data["qty"].." / "..data2)
    end
    --  print(data["qty"].." / "..data2)
  end
end

local function centerWrite(text)
  local width, height = term.getSize()
  local x, y = term.getCursorPos()
  term.setCursorPos(math.ceil((width / 2) - (text:len() / 2)), y)
  term.write(text)
end

local function changePage()
  local event, key = os.pullEvent("key")
  if key == keys.right then
    page = page + 1
    if page >= 25 then
      page = 24
    end
  elseif key == keys.left then
    page = page - 1
    if page <= 0 then
      page = 1
    end
  else
    page = page
    changePage()
  end
end


-- Main Menu
local menu = true
while menu == true do
  print("1. Search\n2. Paged View")
  write("Enter a number: ")
  menuChoice = read()
  menuChoice = tonumber(menuChoice)
  if menuChoice == 1 then
    searchView = true
    menu = false
    break
  elseif menuChoice == 2 then
    pagedView = true
    menu = false
    break
  else
    print("Invalid input. Enter either 1 or 2.")
    menu = false
    menu = true
  end
end

-- Search
while searchView == true do
  write("Search Inventory for: ")
  query = read()
  search(query)
end

--pagination
while pagedView == true do
  if page == 1 then
    term.clear()
    term.setCursorPos(1, 1)
    centerWrite("Page "..page.." of 24")
    term.setCursorPos(1, 3)
    for i = 0, 7 do
      local c = peripheral.wrap("tile_thermalexpansion_cache_resonant_name_"..tostring(i))
      local data = c.getStoredItems()
      local data2 = c.getMaxStoredItems()
      print(data["display_name"])
      print(data["qty"].." / "..data2)
    end
    changePage()

  elseif page == 2 then
    term.clear()
    term.setCursorPos(1, 1)
    centerWrite("Page "..page.." of 24")
    term.setCursorPos(1, 3)
    for i = 8, 15 do
      local c = peripheral.wrap("tile_thermalexpansion_cache_resonant_name_"..tostring(i))
      local data = c.getStoredItems()
      local data2 = c.getMaxStoredItems()
      print(data["display_name"])
      print(data["qty"].." / "..data2)
    end
    changePage()

  elseif page == 3 then
    term.clear()
    term.setCursorPos(1, 1)
    centerWrite("Page "..page.." of 24")
    term.setCursorPos(1, 3)
    for i = 16, 23 do
      local c = peripheral.wrap("tile_thermalexpansion_cache_resonant_name_"..tostring(i))
      local data = c.getStoredItems()
      local data2 = c.getMaxStoredItems()
      print(data["display_name"])
      print(data["qty"].." / "..data2)
    end
    changePage()

  elseif page == 4 then
    term.clear()
    term.setCursorPos(1, 1)
    centerWrite("Page "..page.." of 24")
    term.setCursorPos(1, 3)
    for i = 24, 31 do
      local c = peripheral.wrap("tile_thermalexpansion_cache_resonant_name_"..tostring(i))
      local data = c.getStoredItems()
      local data2 = c.getMaxStoredItems()
      print(data["display_name"])
      print(data["qty"].." / "..data2)
    end
    changePage()

  elseif page == 5 then
    term.clear()
    term.setCursorPos(1, 1)
    centerWrite("Page "..page.." of 24")
    term.setCursorPos(1, 3)
    for i = 32, 39 do
      local c = peripheral.wrap("tile_thermalexpansion_cache_resonant_name_"..tostring(i))
      local data = c.getStoredItems()
      local data2 = c.getMaxStoredItems()
      print(data["display_name"])
      print(data["qty"].." / "..data2)
    end
    changePage()

  elseif page == 6 then
    term.clear()
    term.setCursorPos(1, 1)
    centerWrite("Page "..page.." of 24")
    term.setCursorPos(1, 3)
    for i = 40, 47 do
      local c = peripheral.wrap("tile_thermalexpansion_cache_resonant_name_"..tostring(i))
      local data = c.getStoredItems()
      local data2 = c.getMaxStoredItems()
      print(data["display_name"])
      print(data["qty"].." / "..data2)
    end
    changePage()

  elseif page == 7 then
    term.clear()
    term.setCursorPos(1, 1)
    centerWrite("Page "..page.." of 24")
    term.setCursorPos(1, 3)
    for i = 48, 55 do
      local c = peripheral.wrap("tile_thermalexpansion_cache_resonant_name_"..tostring(i))
      local data = c.getStoredItems()
      local data2 = c.getMaxStoredItems()
      print(data["display_name"])
      print(data["qty"].." / "..data2)
    end
    changePage()

  elseif page == 8 then
    term.clear()
    term.setCursorPos(1, 1)
    centerWrite("Page "..page.." of 24")
    term.setCursorPos(1, 3)
    for i = 56, 63 do
      local c = peripheral.wrap("tile_thermalexpansion_cache_resonant_name_"..tostring(i))
      local data = c.getStoredItems()
      local data2 = c.getMaxStoredItems()
      print(data["display_name"])
      print(data["qty"].." / "..data2)
    end
    changePage()

  elseif page == 9 then
    term.clear()
    term.setCursorPos(1, 1)
    centerWrite("Page "..page.." of 24")
    term.setCursorPos(1, 3)
    for i = 64, 71 do
      local c = peripheral.wrap("tile_thermalexpansion_cache_resonant_name_"..tostring(i))
      local data = c.getStoredItems()
      local data2 = c.getMaxStoredItems()
      print(data["display_name"])
      print(data["qty"].." / "..data2)
    end
    changePage()

  elseif page == 10 then
    term.clear()
    term.setCursorPos(1, 1)
    centerWrite("Page "..page.." of 24")
    term.setCursorPos(1, 3)
    for i = 72, 79 do
      local c = peripheral.wrap("tile_thermalexpansion_cache_resonant_name_"..tostring(i))
      local data = c.getStoredItems()
      local data2 = c.getMaxStoredItems()
      print(data["display_name"])
      print(data["qty"].." / "..data2)
    end
    changePage()

  elseif page == 11 then
    term.clear()
    term.setCursorPos(1, 1)
    centerWrite("Page "..page.." of 24")
    term.setCursorPos(1, 3)
    for i = 80, 87 do
      local c = peripheral.wrap("tile_thermalexpansion_cache_resonant_name_"..tostring(i))
      local data = c.getStoredItems()
      local data2 = c.getMaxStoredItems()
      print(data["display_name"])
      print(data["qty"].." / "..data2)
    end
    changePage()

  elseif page == 12 then
    term.clear()
    term.setCursorPos(1, 1)
    centerWrite("Page "..page.." of 24")
    term.setCursorPos(1, 3)
    for i = 88, 95 do
      local c = peripheral.wrap("tile_thermalexpansion_cache_resonant_name_"..tostring(i))
      local data = c.getStoredItems()
      local data2 = c.getMaxStoredItems()
      print(data["display_name"])
      print(data["qty"].." / "..data2)
    end
    changePage()

  elseif page == 13 then
    term.clear()
    term.setCursorPos(1, 1)
    centerWrite("Page "..page.." of 24")
    term.setCursorPos(1, 3)
    for i = 96, 103 do
      local c = peripheral.wrap("tile_thermalexpansion_cache_resonant_name_"..tostring(i))
      local data = c.getStoredItems()
      local data2 = c.getMaxStoredItems()
      print(data["display_name"])
      print(data["qty"].." / "..data2)
    end
    changePage()

  elseif page == 14 then
    term.clear()
    term.setCursorPos(1, 1)
    centerWrite("Page "..page.." of 24")
    term.setCursorPos(1, 3)
    for i = 104, 111 do
      local c = peripheral.wrap("tile_thermalexpansion_cache_resonant_name_"..tostring(i))
      local data = c.getStoredItems()
      local data2 = c.getMaxStoredItems()
      print(data["display_name"])
      print(data["qty"].." / "..data2)
    end
    changePage()

  elseif page == 15 then
    term.clear()
    term.setCursorPos(1, 1)
    centerWrite("Page "..page.." of 24")
    term.setCursorPos(1, 3)
    for i = 112, 119 do
      local c = peripheral.wrap("tile_thermalexpansion_cache_resonant_name_"..tostring(i))
      local data = c.getStoredItems()
      local data2 = c.getMaxStoredItems()
      print(data["display_name"])
      print(data["qty"].." / "..data2)
    end
    changePage()

  elseif page == 16 then
    term.clear()
    term.setCursorPos(1, 1)
    centerWrite("Page "..page.." of 24")
    term.setCursorPos(1, 3)
    for i = 120, 127 do
      local c = peripheral.wrap("tile_thermalexpansion_cache_resonant_name_"..tostring(i))
      local data = c.getStoredItems()
      local data2 = c.getMaxStoredItems()
      print(data["display_name"])
      print(data["qty"].." / "..data2)
    end
    changePage()

  elseif page == 17 then
    term.clear()
    term.setCursorPos(1, 1)
    centerWrite("Page "..page.." of 24")
    term.setCursorPos(1, 3)
    for i = 128, 135 do
      local c = peripheral.wrap("tile_thermalexpansion_cache_resonant_name_"..tostring(i))
      local data = c.getStoredItems()
      local data2 = c.getMaxStoredItems()
      print(data["display_name"])
      print(data["qty"].." / "..data2)
    end
    changePage()

  elseif page == 18 then
    term.clear()
    term.setCursorPos(1, 1)
    centerWrite("Page "..page.." of 24")
    term.setCursorPos(1, 3)
    for i = 136, 143 do
      local c = peripheral.wrap("tile_thermalexpansion_cache_resonant_name_"..tostring(i))
      local data = c.getStoredItems()
      local data2 = c.getMaxStoredItems()
      print(data["display_name"])
      print(data["qty"].." / "..data2)
    end
    changePage()

  elseif page == 19 then
    term.clear()
    term.setCursorPos(1, 1)
    centerWrite("Page "..page.." of 24")
    term.setCursorPos(1, 3)
    for i = 144, 151 do
      local c = peripheral.wrap("tile_thermalexpansion_cache_resonant_name_"..tostring(i))
      local data = c.getStoredItems()
      local data2 = c.getMaxStoredItems()
      print(data["display_name"])
      print(data["qty"].." / "..data2)
    end
    changePage()

  elseif page == 20 then
    term.clear()
    term.setCursorPos(1, 1)
    centerWrite("Page "..page.." of 24")
    term.setCursorPos(1, 3)
    for i = 152, 159 do
      local c = peripheral.wrap("tile_thermalexpansion_cache_resonant_name_"..tostring(i))
      local data = c.getStoredItems()
      local data2 = c.getMaxStoredItems()
      print(data["display_name"])
      print(data["qty"].." / "..data2)
    end
    changePage()

  elseif page == 21 then
    term.clear()
    term.setCursorPos(1, 1)
    centerWrite("Page "..page.." of 24")
    term.setCursorPos(1, 3)
    for i = 160, 167 do
      local c = peripheral.wrap("tile_thermalexpansion_cache_resonant_name_"..tostring(i))
      local data = c.getStoredItems()
      local data2 = c.getMaxStoredItems()
      print(data["display_name"])
      print(data["qty"].." / "..data2)
    end
    changePage()

  elseif page == 22 then
    term.clear()
    term.setCursorPos(1, 1)
    centerWrite("Page "..page.." of 24")
    term.setCursorPos(1, 3)
    for i = 168, 175 do
      local c = peripheral.wrap("tile_thermalexpansion_cache_resonant_name_"..tostring(i))
      local data = c.getStoredItems()
      local data2 = c.getMaxStoredItems()
      print(data["display_name"])
      print(data["qty"].." / "..data2)
    end
    changePage()

  elseif page == 23 then
    term.clear()
    term.setCursorPos(1, 1)
    centerWrite("Page "..page.." of 24")
    term.setCursorPos(1, 3)
    for i = 176, 183 do
      local c = peripheral.wrap("tile_thermalexpansion_cache_resonant_name_"..tostring(i))
      local data = c.getStoredItems()
      local data2 = c.getMaxStoredItems()
      print(data["display_name"])
      print(data["qty"].." / "..data2)
    end
    changePage()

  elseif page == 24 then
    term.clear()
    term.setCursorPos(1, 1)
    centerWrite("Page "..page.." of 24")
    term.setCursorPos(1, 3)
    for i = 184, 190 do -- remainder 1, can add 1 to this before needing a new page
      local c = peripheral.wrap("tile_thermalexpansion_cache_resonant_name_"..tostring(i))
      local data = c.getStoredItems()
      local data2 = c.getMaxStoredItems()
      print(data["display_name"])
      print(data["qty"].." / "..data2)
    end
    changePage()
  end
end
--can display about 8 results, dedicate 1 line to page number and another to the search bar and there will be no lines left

--[[ stolen code from terminal glasses
t = peripheral.wrap(tile_thermalexpansion_cache_resonant_name_0)
capacity = t.getMaxEnergyStored("")
amount = t.getEnergyStored("")



-- working code
cache = peripheral.wrap("tile_thermalexpansion_cache_resonant_name_0")
local data = cache.getStoredItems()
local data2 = cache.getMaxStoredItems()
print(data["display_name"])
print(data["qty"].." / "..data2)

--working code multiple modems
cache = peripheral.wrap("tile_thermalexpansion_cache_resonant_name_1")
cache2 = peripheral.wrap("tile_thermalexpansion_cache_resonant_name_2")
local cdata = cache.getStoredItems()
local cdata2 = cache.getMaxStoredItems()
local c2data = cache2.getStoredItems()
local c2data2 = cache2.getMaxStoredItems()
print(cdata["display_name"])
print(cdata["qty"].." / "..cdata2)
print(c2data["display_name"])
print(c2data["qty"].." / "..c2data2)

-- pervious working code
local c = {}
for i = 0, 190 do
  c["cache"..tostring(i)] = "tile_thermalexpansion_cache_resonant_name_"..tostring(i)
  peripheral.wrap(c["cache"..tostring(i)])
end
