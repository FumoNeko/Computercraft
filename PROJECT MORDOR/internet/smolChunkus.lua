rednet.open("back")
--=== Key Config ===--
-- (see http://computercraft.info/wiki/Key_(event) for more keycodes)
exitKey =     57      -- 57:space
-- movement keys
forward =     17      -- 17:w
back =        31      -- 31:s
turnLeft =    30      -- 30:a
turnRight =   32      -- 32:d
ascend =      18      -- 18:e
descend =     16      -- 16:q
-- action keys
getfuel =     33      -- 33:f
refuel =      41      -- 41:`

local function quit()
  term.clear()
  term.setCursorPos(1, 1)
  error("Quit program.")
end

local function send()
  while true do
    local sEvent, key = os.pullEvent("key")
    if sEvent == "key" then
      if key == exitKey then
        quit()
        return
      end
      if key == forward then
        rednet.send(487, "forward")
      end
      if key == back then
        rednet.send(487, "back")
      end
      if key == turnLeft then
        rednet.send(487, "left")
      end
      if key == turnRight then
        rednet.send(487, "right")
      end
      if key == ascend then
        rednet.send(487, "up")
      end
      if key == descend then
        rednet.send(487, "down")
      end
      if key == refuel then
        rednet.send(487, "refuel")
      end
      if key == getfuel then
        rednet.send(487, "getfuel")
      end
    end
  end
end

local function recv()
  while true do
    id, msg = rednet.receive()
    print("ID "..id.." sent "..msg)
  end
end

while true do
  parallel.waitForAny(send, recv)
end
