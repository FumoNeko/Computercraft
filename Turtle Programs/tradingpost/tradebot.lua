--[[
opTradeBot ID = 424
traderA ID = 425
traderB ID = 426
tradingpostServerID = 427
]]

-- listen for offerA
-- check chest of offerA, scan items, interpret data
-- send data to traderB
-- listen for offerB
-- check chest of offerB, scan items, interpret data
-- send data to traderA

--The turtle needs to tell the traders what's inside the other's chest.

--[[local maxChestSlots = 54
local chest = {} -- 9w x 6h]]
--local turtleID = os.getComputerID()
--[[
OFFER A's chest is on the turtle's RIGHT
A's HOLDING chest is on the turtle's TOP
Offer B's chest is on the turtle's LEFT
B's HOLDING chest is on the turtle's BOTTOM
]]

rednet.open("left")
--network listener
while true do
  id, sendermsg = rednet.receive()
  -- Trader A submit
  -- goes through Trader A's chest (right) then deposits into A's holding chest (top)
  if id == 427 and sendermsg == "offerA" then
    -- turn right
    turtle.turnRight()
    -- loop code 4 times, because the turtle only holds 16 slots. We need to do the process 4 times to allow for 54 chest slots
    for i = 1, 4 do
      -- loop this code 16 times, for the amount of slots in the turtle.
      -- get details of each item as they are transferred to the holding chest and send to the server
      for i = 1, 16 do
        turtle.select(i)
        turtle.suck()
        local data = turtle.getItemDetail(i)
        if data then
          rednet.send(427, "offerAItem: "..data.name)
          rednet.send(427, "offerADamage: "..data.damage)
          rednet.send(427, "offerACount: "..data.count)
        end
        --drops items into chest above the turtle. https://computercraft.info/wiki/Turtle.dropUp
        turtle.dropUp()
      end
    end
    -- Done doing stuff, turn left back to how it was positioned before.
    turtle.turnLeft()

    -- Trader B submit
    -- goes through all inventory and drops (hopefully into a chest)
  elseif id == 427 and sendermsg == "offerB" then
    turtle.turnLeft()
    for i = 1, 4 do
      for i = 1, 16 do
        turtle.select(i)
        turtle.suck()
        local data = turtle.getItemDetail(i)
        if data then
          rednet.send(427, "offerBItem: "..data.name)
          rednet.send(427, "offerBDamage: "..data.damage)
          rednet.send(427, "offerBCount: "..data.count)
        end
        turtle.dropDown()
      end
    end
    turtle.turnRight()
    -- Decline
  elseif id == 427 and sendermsg == "decline" then
    -- TraderA return
    turtle.turnRight()
    for i = 1, 4 do
      for i = 1, 16 do
        turtle.select(i)
        turtle.suckUp()
        turtle.drop()
      end
    end
    turtle.turnLeft()
    -- TraderB return
    turtle.turnLeft()
    for i = 1, 4 do
      for i = 1, 16 do
        turtle.select(i)
        turtle.suckDown()
        turtle.drop()
      end
    end
    turtle.turnRight()
    -- Accept
  elseif id == 427 and sendermsg == "tradeAuthorized" then
    -- Get Trader B's items from holding chest and deliver to trader A's chest
    turtle.turnRight()
    for i = 1, 4 do
      for i = 1, 16 do
        turtle.select(i)
        turtle.suckDown()
        turtle.drop()
      end
    end
    turtle.turnLeft()
    -- Get Trader A's items from holding chest and deliver to trader B's chest
    turtle.turnLeft()
    for i = 1, 4 do
      for i = 1, 16 do
        turtle.select(i)
        turtle.suckUp()
        turtle.drop()
      end
    end
    turtle.turnRight()
  end
end

  --turtle.suck(number)
  --turtle.suckUp(number)
  --turtle.suckDown(number)
  --turtle.drop() drops items in front of turtle. if a chest is DIRECTLY IN FRONT of the turtle, it will place it in the chest.
  --turtle.dropUp()
  --turtle.dropDown()
  --turtle.select(num) selects slot to act on. A handy dandy tip is to do a for loop and do turtle.select(i)
