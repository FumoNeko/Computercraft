rednet.open("left")
local function send()
  local packet = 0
  while true do
    packet = packet + 1
    rednet.send(464, "packet "..i)
    rednet.send(385, "packet "..i)
    sleep(5)
  end
end

local function recv()
  local id, cmd = rednet.receive()
  if id == 385 and cmd == "forward" then
    turtle.forward()
  elseif id == 385 and cmd == "left" then
    turtle.turnLeft()
  elseif id == 385 and cmd == "right" then
    turtle.turnRight()
  elseif id == 385 and cmd == "up" then
    turtle.up()
  elseif id == 385 and cmd == "down" then
    turtle.down()
  elseif id == 385 and cmd == "refuel" then
    turtle.refuel()
  elseif id == 385 and cmd == "getfuel" then
  local data = turtle.getFuelLevel()
  rednet.send(385, data)
  end
end

while true do
  parallel.waitForAny(send, recv)
end
