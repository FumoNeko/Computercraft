rednet.open("front")
rednet.open("top")
acceptTradeA = false
acceptTradeB = false
--network listener
while true do
  local src = "unknown"
  id, sendermsg = rednet.receive()
  if id == 425 then src = "traderA"
  elseif id == 426 then src = "traderB"
  else src = "unknown"
  end
  print("ID: "..id.." Name: "..src.." sent packet "..sendermsg)
  --forward rednet from traderA to turtle, tells it to check offer chest.
  if id == 425 and sendermsg == "offerA" then
    rednet.send(424, sendermsg)
    --forward rednet from traderB to turtle, tells it to check offer chest
  elseif id == 426 and sendermsg == "offerB" then
    rednet.send(424, sendermsg)
    -- A to B demands (chat)
  elseif id == 425 and sendermsg == string.match(sendermsg, "\".*\"") then
    rednet.send(426, sendermsg)
    -- B to A demands (chat)
  elseif id == 426 and sendermsg == string.match(sendermsg, "\".*\"") then
    rednet.send(425, sendermsg)
    -- reboot
    -- A to B
  elseif id == 425 and sendermsg == "reboot" then
    rednet.send(426, sendermsg)
    -- B to A
  elseif id == 426 and sendermsg == "reboot" then
    rednet.send(426, sendermsg)
    -- decline
    -- A to turtle
  elseif id == 425 and sendermsg == "decline" then
    rednet.send(424, sendermsg)
    -- B to turtle
  elseif id == 426 and sendermsg == "decline" then
    rednet.send(424, sendermsg)
    -- Accept
    -- traderA accept flag
  elseif id == 425 and sendermsg == "acceptTradeA" then
    acceptTradeA = true
    -- traderB accept flag
  elseif id == 426 and sendermsg == "acceptTradeB" then
    acceptTradeB = true
    --forward turtle item data to traderA
  elseif id == 424 and sendermsg == string.match(sendermsg, "offerAItem: .*") then
    rednet.send(426, sendermsg)
  elseif id == 424 and sendermsg == string.match(sendermsg, "offerADamage: .*") then
    rednet.send(426, sendermsg)
  elseif id == 424 and sendermsg == string.match(sendermsg, "offerACount: .*") then
    rednet.send(426, sendermsg)
    --forward turtle item data to traderB
  elseif id == 424 and sendermsg == string.match(sendermsg, "offerBItem: .*") then
    rednet.send(425, sendermsg)
  elseif id == 424 and sendermsg == string.match(sendermsg, "offerBDamage: .*") then
    rednet.send(425, sendermsg)
  elseif id == 424 and sendermsg == string.match(sendermsg, "offerBCount: .*") then
    rednet.send(425, sendermsg)
  end
  -- trade auth
  if acceptTradeA == true and acceptTradeB == true then
    rednet.send(424, "tradeAuthorized")
    print("Trade Authorized")
    acceptTradeA = false
    acceptTradeB = false
  end
end
