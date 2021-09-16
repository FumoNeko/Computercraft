--RedNetLog by MisterMeister32
--program is not owned by me
-- original forum post at https://www.computercraft.info/forums2/index.php?/topic/29450-rednetlog/page__hl__download__fromsearch__1
-- pastebin get wCBNGPiy rnlog
local function open()

  local p = peripheral.getNames()
  local modem = nil
  local for i = 1, #p do --seaching for modems
    if peripheral.getType(p[i]) == "modem" then
      modem = p[i]
    end
  end

  if modem == nil then --opening, when found
    return false
  else
    rednet.open(modem)
    return true
  end

end


local function log() --actual logger

  while true do
    local id, msg, prot = rednet.receive()
    msg = textutils.serialise(msg)
    print(id.."("..prot.."):"..msg)
  end

end


local function stop() --stop on keypress

  while true do
    local a = os.pullEvent("key")
    if a == "key" then
      break
    end
  end

end


if open() then
  print("Press any key to exit.")
  parallel.waitForAny(log, stop)
else
  print("No modem found.")
end
