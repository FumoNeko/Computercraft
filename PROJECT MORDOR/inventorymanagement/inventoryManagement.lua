---@diagnostic disable: undefined-field
-- initialization
peripheral.wrap("back")
peripheral.wrap("monitor_7")
peripheral.wrap("opernperipheral_bridge_0")
peripheral.wrap("down")
local tableLookup = {
  ["tile_thermalexpansion_cache_resonant_name_0"] = "Oak Sapling",
  ["tile_thermalexpansion_cache_resonant_name_1"] = "Bronze Ingot",
  ["tile_thermalexpansion_cache_resonant_name_2"] = "Lehnori Ingot",
  ["tile_thermalexpansion_cache_resonant_name_3"] = "item.krakentooth.name",
  ["tile_thermalexpansion_cache_resonant_name_4"] = "Rotten Flesh",
  ["tile_thermalexpansion_cache_resonant_name_5"] = "Iron Ingot",
  ["tile_thermalexpansion_cache_resonant_name_6"] = "Miner's Delight",
  ["tile_thermalexpansion_cache_resonant_name_7"] = "item.nightmarescale.name",
  ["tile_thermalexpansion_cache_resonant_name_8"] = "Silver Ingot",
  ["tile_thermalexpansion_cache_resonant_name_9"] = "Rich Slag",
  ["tile_thermalexpansion_cache_resonant_name_10"] = "Nether Brick",
  ["tile_thermalexpansion_cache_resonant_name_11"] = "Shiny Ingot",
  ["tile_thermalexpansion_cache_resonant_name_12"] = "Advanced Computer",
  ["tile_thermalexpansion_cache_resonant_name_13"] = "Wired Modem",
  ["tile_thermalexpansion_cache_resonant_name_14"] = "Redstone",
  ["tile_thermalexpansion_cache_resonant_name_15"] = "Iron Nugget",
  ["tile_thermalexpansion_cache_resonant_name_16"] = "Lapis Lazuli",
  ["tile_thermalexpansion_cache_resonant_name_17"] = "Golden Apple",
  ["tile_thermalexpansion_cache_resonant_name_18"] = "Glass Pane",
  ["tile_thermalexpansion_cache_resonant_name_19"] = "Moss Stone",
  ["tile_thermalexpansion_cache_resonant_name_20"] = "Dilithium Dust",
  ["tile_thermalexpansion_cache_resonant_name_21"] = "item.uranium_nugget.name",
  ["tile_thermalexpansion_cache_resonant_name_22"] = "White anemone",
  ["tile_thermalexpansion_cache_resonant_name_23"] = "Steam Dynamo",
  ["tile_thermalexpansion_cache_resonant_name_24"] = "Birch Wood",
  ["tile_thermalexpansion_cache_resonant_name_25"] = "Pulverized Coal",
  ["tile_thermalexpansion_cache_resonant_name_26"] = "Block of Gold",
  ["tile_thermalexpansion_cache_resonant_name_27"] = "Tin Nugget",
  ["tile_thermalexpansion_cache_resonant_name_28"] = "Gold Nugget",
  ["tile_thermalexpansion_cache_resonant_name_29"] = "Cobblestone Slab",
  ["tile_thermalexpansion_cache_resonant_name_30"] = "Glass",
  ["tile_thermalexpansion_cache_resonant_name_31"] = "Weighted Pressure Plate (Light)",
  ["tile_thermalexpansion_cache_resonant_name_32"] = "Golden Apple",
  ["tile_thermalexpansion_cache_resonant_name_33"] = "item.eggbee.name",
  ["tile_thermalexpansion_cache_resonant_name_34"] = "item.godzillascale.name",
  ["tile_thermalexpansion_cache_resonant_name_35"] = "tile.blockuranium.name",
  ["tile_thermalexpansion_cache_resonant_name_36"] = "Block of Diamond",
  ["tile_thermalexpansion_cache_resonant_name_37"] = "item.ingoturanium.name",
  ["tile_thermalexpansion_cache_resonant_name_38"] = "Emerald",
  ["tile_thermalexpansion_cache_resonant_name_39"] = "Electrum Ingot",
  ["tile_thermalexpansion_cache_resonant_name_40"] = "Rose Gold Ingot",
  ["tile_thermalexpansion_cache_resonant_name_41"] = "Tin Ingot",
  ["tile_thermalexpansion_cache_resonant_name_42"] = "Hyperbolic Time Chamber Floor",
  ["tile_thermalexpansion_cache_resonant_name_43"] = "tile.orepig.name",
  ["tile_thermalexpansion_cache_resonant_name_44"] = "Milk Jug",
  ["tile_thermalexpansion_cache_resonant_name_45"] = "Clover",
  ["tile_thermalexpansion_cache_resonant_name_46"] = "Tech Chip Tier 1",
  ["tile_thermalexpansion_cache_resonant_name_47"] = "item.zookeeper.name",
  ["tile_thermalexpansion_cache_resonant_name_48"] = "Book",
  ["tile_thermalexpansion_cache_resonant_name_49"] = "Flesh",
  ["tile_thermalexpansion_cache_resonant_name_50"] = "Stone Bricks",
  ["tile_thermalexpansion_cache_resonant_name_51"] = "Mushroom",
  ["tile_thermalexpansion_cache_resonant_name_52"] = "Cooked Porkchop",
  ["tile_thermalexpansion_cache_resonant_name_53"] = "Granite",
  ["tile_thermalexpansion_cache_resonant_name_54"] = "Dandelion Yellow",
  ["tile_thermalexpansion_cache_resonant_name_55"] = "Potion of Fire Resistance",
  ["tile_thermalexpansion_cache_resonant_name_56"] = "Bone Meal",
  ["tile_thermalexpansion_cache_resonant_name_57"] = "Andesite",
  ["tile_thermalexpansion_cache_resonant_name_58"] = "Acacia Wood",
  ["tile_thermalexpansion_cache_resonant_name_59"] = "Oak Wood Planks",
  ["tile_thermalexpansion_cache_resonant_name_60"] = "Mushroom",
  ["tile_thermalexpansion_cache_resonant_name_61"] = "tile.blockamethyst.name",
  ["tile_thermalexpansion_cache_resonant_name_62"] = "Ruby",
  ["tile_thermalexpansion_cache_resonant_name_63"] = "Red Stained Glass",
  ["tile_thermalexpansion_cache_resonant_name_64"] = "Item IO Circuit Board",
  ["tile_thermalexpansion_cache_resonant_name_65"] = "Diamond",
  ["tile_thermalexpansion_cache_resonant_name_66"] = "Copper Ingot",
  ["tile_thermalexpansion_cache_resonant_name_67"] = "Sponge",
  ["tile_thermalexpansion_cache_resonant_name_68"] = "Block of Emerald",
  ["tile_thermalexpansion_cache_resonant_name_69"] = "Blitz Rod",
  ["tile_thermalexpansion_cache_resonant_name_70"] = "Blitz Powder",
  ["tile_thermalexpansion_cache_resonant_name_71"] = "Snowball",
  ["tile_thermalexpansion_cache_resonant_name_72"] = "Gold Plate",
  ["tile_thermalexpansion_cache_resonant_name_73"] = "Niter",
  ["tile_thermalexpansion_cache_resonant_name_74"] = "Potato",
  ["tile_thermalexpansion_cache_resonant_name_75"] = "item.titanium_nugget.name",
  ["tile_thermalexpansion_cache_resonant_name_76"] = "tile.blockruby.name",
  ["tile_thermalexpansion_cache_resonant_name_77"] = "item.waterball.name",
  ["tile_thermalexpansion_cache_resonant_name_78"] = "Stick",
  ["tile_thermalexpansion_cache_resonant_name_79"] = "Oak Wood",
  ["tile_thermalexpansion_cache_resonant_name_80"] = "Concrete",
  ["tile_thermalexpansion_cache_resonant_name_81"] = "Block of Quartz",
  ["tile_thermalexpansion_cache_resonant_name_82"] = "Salt",
  ["tile_thermalexpansion_cache_resonant_name_83"] = "Wheat",
  ["tile_thermalexpansion_cache_resonant_name_84"] = "Diorite",
  ["tile_thermalexpansion_cache_resonant_name_85"] = "item.mantisclaw.name",
  ["tile_thermalexpansion_cache_resonant_name_86"] = "Item Frame",
  ["tile_thermalexpansion_cache_resonant_name_87"] = "Sugar",
  ["tile_thermalexpansion_cache_resonant_name_88"] = "Saddle",
  ["tile_thermalexpansion_cache_resonant_name_89"] = "Birch Sapling",
  ["tile_thermalexpansion_cache_resonant_name_90"] = "Torch",
  ["tile_thermalexpansion_cache_resonant_name_91"] = "Acacia Sapling",
  ["tile_thermalexpansion_cache_resonant_name_92"] = "Shrub",
  ["tile_thermalexpansion_cache_resonant_name_93"] = "Nether Wart",
  ["tile_thermalexpansion_cache_resonant_name_94"] = "Spider Eye",
  ["tile_thermalexpansion_cache_resonant_name_95"] = "Feather",
  ["tile_thermalexpansion_cache_resonant_name_96"] = "Steak",
  ["tile_thermalexpansion_cache_resonant_name_97"] = "Stone Slab",
  ["tile_thermalexpansion_cache_resonant_name_98"] = "Ink Sac",
  ["tile_thermalexpansion_cache_resonant_name_99"] = "String",
  ["tile_thermalexpansion_cache_resonant_name_100"] = "Seeds",
  ["tile_thermalexpansion_cache_resonant_name_101"] = "Warenai Crystal",
  ["tile_thermalexpansion_cache_resonant_name_102"] = "Coal",
  ["tile_thermalexpansion_cache_resonant_name_103"] = "Limestone",
  ["tile_thermalexpansion_cache_resonant_name_104"] = "Cobblestone",
  ["tile_thermalexpansion_cache_resonant_name_105"] = "Ladder",
  ["tile_thermalexpansion_cache_resonant_name_106"] = "Lead",
  ["tile_thermalexpansion_cache_resonant_name_107"] = "Computer",
  ["tile_thermalexpansion_cache_resonant_name_108"] = "Dinosaur Meat",
  ["tile_thermalexpansion_cache_resonant_name_109"] = "tile.orechipmunk.name",
  ["tile_thermalexpansion_cache_resonant_name_110"] = "JJay",
  ["tile_thermalexpansion_cache_resonant_name_111"] = "Lead Ingot",
  ["tile_thermalexpansion_cache_resonant_name_112"] = "HeatProof Brick",
  ["tile_thermalexpansion_cache_resonant_name_113"] = "Control Circuit Board",
  ["tile_thermalexpansion_cache_resonant_name_114"] = "Peony",
  ["tile_thermalexpansion_cache_resonant_name_115"] = "Cooked Chicken",
  ["tile_thermalexpansion_cache_resonant_name_116"] = "Stone Bricks Slab",
  ["tile_thermalexpansion_cache_resonant_name_117"] = "Blaze Powder",
  ["tile_thermalexpansion_cache_resonant_name_118"] = "Copper Ingot",
  ["tile_thermalexpansion_cache_resonant_name_119"] = "tile.krakenrepellent.name",
  ["tile_thermalexpansion_cache_resonant_name_120"] = "Rocky Dirt",
  ["tile_thermalexpansion_cache_resonant_name_121"] = "Pumpkin",
  ["tile_thermalexpansion_cache_resonant_name_122"] = "Networking Cable",
  ["tile_thermalexpansion_cache_resonant_name_123"] = "tile.blocktitanium.name",
  ["tile_thermalexpansion_cache_resonant_name_124"] = "Cocoa Beans",
  ["tile_thermalexpansion_cache_resonant_name_125"] = "Oak Leaves",
  ["tile_thermalexpansion_cache_resonant_name_126"] = "Gravel",
  ["tile_thermalexpansion_cache_resonant_name_127"] = "Flint",
  ["tile_thermalexpansion_cache_resonant_name_128"] = "Slimeball",
  ["tile_thermalexpansion_cache_resonant_name_129"] = "Light Blue Dye",
  ["tile_thermalexpansion_cache_resonant_name_130"] = "Block of Coal",
  ["tile_thermalexpansion_cache_resonant_name_131"] = "Stone",
  ["tile_thermalexpansion_cache_resonant_name_132"] = "Bucket",
  ["tile_thermalexpansion_cache_resonant_name_133"] = "Fence",
  ["tile_thermalexpansion_cache_resonant_name_134"] = "Paper",
  ["tile_thermalexpansion_cache_resonant_name_135"] = "Marble",
  ["tile_thermalexpansion_cache_resonant_name_136"] = "Bricks",
  ["tile_thermalexpansion_cache_resonant_name_137"] = "item.salt.name",
  ["tile_thermalexpansion_cache_resonant_name_138"] = "Water Bottle",
  ["tile_thermalexpansion_cache_resonant_name_139"] = "Sign",
  ["tile_thermalexpansion_cache_resonant_name_140"] = "Cooked Dinosaur Meat",
  ["tile_thermalexpansion_cache_resonant_name_141"] = "Leather",
  ["tile_thermalexpansion_cache_resonant_name_142"] = "Algae",
  ["tile_thermalexpansion_cache_resonant_name_143"] = "Button",
  ["tile_thermalexpansion_cache_resonant_name_144"] = "Stone Brick Stairs",
  ["tile_thermalexpansion_cache_resonant_name_145"] = "Sugar Canes",
  ["tile_thermalexpansion_cache_resonant_name_146"] = "Chest",
  ["tile_thermalexpansion_cache_resonant_name_147"] = "Arrow",
  ["tile_thermalexpansion_cache_resonant_name_148"] = "Gunpowder",
  ["tile_thermalexpansion_cache_resonant_name_149"] = "Silicon Wafer",
  ["tile_thermalexpansion_cache_resonant_name_150"] = "Dirt",
  ["tile_thermalexpansion_cache_resonant_name_151"] = "Obsidian",
  ["tile_thermalexpansion_cache_resonant_name_152"] = "item.amethyst.name",
  ["tile_thermalexpansion_cache_resonant_name_153"] = "Compass",
  ["tile_thermalexpansion_cache_resonant_name_154"] = "Quicksand",
  ["tile_thermalexpansion_cache_resonant_name_155"] = "Dirty Cobblestone",
  ["tile_thermalexpansion_cache_resonant_name_156"] = "Apple",
  ["tile_thermalexpansion_cache_resonant_name_157"] = "tile.orecamarasaurus.name",
  ["tile_thermalexpansion_cache_resonant_name_158"] = "Copper Plate",
  ["tile_thermalexpansion_cache_resonant_name_159"] = "Magma Cream",
  ["tile_thermalexpansion_cache_resonant_name_160"] = "Raw Chicken",
  ["tile_thermalexpansion_cache_resonant_name_161"] = "Acacia Wood Planks",
  ["tile_thermalexpansion_cache_resonant_name_162"] = "Aluminum Ingot",
  ["tile_thermalexpansion_cache_resonant_name_163"] = "Copper Dust",
  ["tile_thermalexpansion_cache_resonant_name_164"] = "tile.AntBlock.name",
  ["tile_thermalexpansion_cache_resonant_name_165"] = "Iron Rod",
  ["tile_thermalexpansion_cache_resonant_name_166"] = "Sand",
  ["tile_thermalexpansion_cache_resonant_name_167"] = "Silicon Ingot",
  ["tile_thermalexpansion_cache_resonant_name_168"] = "Disk Drive",
  ["tile_thermalexpansion_cache_resonant_name_169"] = "item.rocksmall.name",
  ["tile_thermalexpansion_cache_resonant_name_170"] = "Titanium Ingot",
  ["tile_thermalexpansion_cache_resonant_name_171"] = "BLT",
  ["tile_thermalexpansion_cache_resonant_name_172"] = "tile.redanttroll.name",
  ["tile_thermalexpansion_cache_resonant_name_173"] = "Ferrous Ingot",
  ["tile_thermalexpansion_cache_resonant_name_174"] = "Strongbox",
  ["tile_thermalexpansion_cache_resonant_name_175"] = "tile.termitetroll.name",
  ["tile_thermalexpansion_cache_resonant_name_176"] = "item.eggmantis.name",
  ["tile_thermalexpansion_cache_resonant_name_177"] = "Senzu Bean",
  ["tile_thermalexpansion_cache_resonant_name_178"] = "item.ingottitanium.name",
  ["tile_thermalexpansion_cache_resonant_name_179"] = "Eye of Ender",
  ["tile_thermalexpansion_cache_resonant_name_180"] = "Slag",
  ["tile_thermalexpansion_cache_resonant_name_181"] = "Nether Quartz",
  ["tile_thermalexpansion_cache_resonant_name_182"] = "Sulfur",
  ["tile_thermalexpansion_cache_resonant_name_183"] = "Cactus Green",
  ["tile_thermalexpansion_cache_resonant_name_184"] = "Wildflower",
  ["tile_thermalexpansion_cache_resonant_name_185"] = "tile.extremetorch.name",
  ["tile_thermalexpansion_cache_resonant_name_186"] = "Lime Dye",
  ["tile_thermalexpansion_cache_resonant_name_187"] = "Flower Pot",
  ["tile_thermalexpansion_cache_resonant_name_188"] = "Dlog Ingot",
  ["tile_thermalexpansion_cache_resonant_name_189"] = "item.deadstinkbug.name",
  ["tile_thermalexpansion_cache_resonant_name_190"] = "Oak Wood Slab",
}

local searchView = nil
local pagedView = nil
local page = 1
local w, h = term.getSize() -- usable lines = h - 2  (19 usable in default so usable = 17)
local usableLines = h - 2
local pagecounter = 0
local innerpagecounter1 = 0
local innerpagecounter2 = 0

-- functions
local function tableScan()
  local objects = 1
  for k, v in pairs(tableLookup) do
    objects = objects + 1
  end
  return objects
end

local numberOfObjects = tableScan()
local maxPages = math.ceil(numberOfObjects/usableLines)

local function search(searchTerm)
  for k, v in pairs(tableLookup) do
    local qry = string.find(v)
    if qry ~= nil then
      local c = peripheral.wrap(k)
      local data = c.getStoredItems()
      local data2 = c.getMaxStoredItems()
      term.clear()
      print(data["display_name"])
      print(data["qty"].." / "..data2)
      break
    end
  end
end


-- pregenerated search
-- create a pregenerated search for common ore "iron, copper, platinum, etc."
local function preSearch(num)
  if num == 1 then
    print("this submenu1 isn't done yet")
  elseif num == 2 then
    print("this submenu2 isn't done yet")
  elseif num == 3 then
    print("this submenu3 isn't done yet")
  elseif num == 4 then
    print("this submenu4 isn't done yet")
  elseif num == 5 then
    print("this submenu5 isn't done yet")
  elseif num == 6 then
    print("this submenu6 isn't done yet")
  elseif num == 7 then
    print("this submenu7 isn't done yet")
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
    pagecounter = pagecounter + 1
    if pagecounter >= maxPages - 1 then
      pagecounter = maxPages - 1
    end
    term.clear()
    term.setCursorPos(1, 1)
    centerWrite("Page "..page.." of"..maxPages)
    term.setCursorPos(1, 3)
  elseif key == keys.left then
    pagecounter = pagecounter - 1
    if pagecounter <= -1 then
      pagecounter = 0
    end
    term.clear()
    term.setCursorPos(1, 1)
    centerWrite("Page "..page.." of"..maxPages)
    term.setCursorPos(1, 3)
  elseif key == keys.q then
    pagedView = false
    MENU = true
  else
    pagecounter = pagecounter
    changePage()
  end
end


-- Main Menu
MENU = true
while MENU == true do
  print("1. Search\n2. Paged View\n3.Pregenerated Search")
  write("Enter a number: ")
  local menuChoice = read()
  menuChoice = tonumber(menuChoice)
  if menuChoice == 1 then
    searchView = true
    MENU = false
    break
  elseif menuChoice == 2 then
    pagedView = true
    MENU = false
    break
  elseif menuChoice == 3 then
    local submenu = true
    MENU = false
    if submenu == true then
      print("1.Ore\n2.Intermediate Products\n3. Machines/Production\n4.Logistics\n5.Tools\n6.Combat\n7.Utility")
      write("Enter a number:")
      local submenuChoice = read()
      submenuChoice = tonumber(submenuChoice)
      if submenuChoice == 1 then
        submenu = false
        preSearch(1)
      elseif submenuChoice == 2 then
        submenu = false
        preSearch(2)
      elseif submenuChoice == 3 then
        submenu = false
        preSearch(3)
      elseif submenuChoice == 4 then
        submenu = false
        preSearch(4)
      elseif submenuChoice == 5 then
        submenu = false
        preSearch(5)
      elseif submenuChoice == 6 then
        submenu = false
        preSearch(6)
      elseif submenuChoice == 7 then
        submenu = false
        preSearch(7)
      end
    end
  else
    print("Invalid input. Enter either 1 or 2.")
    MENU = false
    MENU = true
  end
end

-- Search
while searchView == true do
  write("Search Inventory for: ")
  local query = read()
  search(query)
  searchView = false
  MENU = true
end

--pagination
while pagedView == true do
  term.clear()
  term.setCursorPos(1, 1)
  centerWrite("Page "..page.." of"..maxPages)
  term.setCursorPos(1, 3)
    for i = page+pagecounter, maxPages do
      if page > 1 then
        innerpagecounter1 = usableLines * page - usableLines
        innerpagecounter2 = usableLines * page - 1 - usableLines
      else
        innerpagecounter1 = 0
        innerpagecounter2 = 0
      end
      for i = 0+innerpagecounter1, usableLines+innerpagecounter2 do
        local linex, liney = term.getCursorPos()
        local c = peripheral.wrap("tile_thermalexpansion_cache_resonant_name_"..tostring(i))
        local data = c.getStoredItems()
        local data2 = c.getMaxStoredItems()
        print(data["display_name"].." / "..data["qty"].." / "..data2)
        if liney >= h or c == nil then
          changePage()
        end
      end
    end
end
