rednet.open("left")
term.clear()
term.setCursorPos(1, 1)
print("Welcome to Ozroth Trading post!\nInput your offer into the chest.\nWhen you are done, enter the command: \"offer\"\nFor a list of commands, enter the command: \"help\"")

function send()
menu = true

  --commandline interface
  while menu == true do
    write("\nEnter command: ")
    local cmd = read()
    if cmd == "offer" then
      rednet.send(427, "offerA")

      --demand command
    elseif cmd == "demand" then
      print("Enter your demands to the other trader. Return to Command mode with \"/exit\"")
      repeat
        menu = false
        local msg = read()
        rednet.send(427, "\""..msg.."\"")
        if msg == "/exit" then
          menu = true
        end
      until menu == true

      --exit program
    elseif cmd == "exit" then
      error("Program terminated")

      -- clear screen command
    elseif cmd == "clear" then
      term.clear()
      term.setCursorPos(1, 1)

      -- decline command
    elseif cmd == "decline" then
      rednet.send(427, "decline")
      rednet.send(427, "reboot")
      os.reboot()

    elseif cmd == "accept" then
      rednet.send(427, "acceptTradeA")

      --help commands
    elseif cmd == "help" then
      print("Commands: help, demand, exit, clear, offer, accept, decline\nPrefix a command with help to learn more about it.")
    elseif cmd == "help help" then
      print("Displays commands.")
    elseif cmd == "help demand" then
      print("Request items from the other trader.")
    elseif cmd == "help clear" then
      print("clears the terminal of clutter.")
    elseif cmd == "help exit" then
      print("exits the program")
    elseif cmd == "help offer" then
      print("Offers your items to the other trader")
    elseif cmd == "help accept" then
      print("accepts trade.")
    elseif cmd == "help decline" then
      print("declines trade and reboots both trading computers.")
    else
      print("unknown command")
    end

  end
end

--network listener
function recv()
  while true do
    local xLine, yLine = term.getCursorPos()
    id, sendermsg = rednet.receive()
    --chat
    if sendermsg == string.match(sendermsg, "\".*\"") and menu == true then
      print("\nTraderB: "..sendermsg.."\nEnter command: ")
      yLine = yLine + 3
      term.setCursorPos(16, yLine)
    elseif sendermsg == string.match(sendermsg, "\".*\"") and menu == false then
      print("\nTraderB: "..sendermsg.."\nEnter Command: ")
      yLine = yLine + 5
      term.setCursorPos(1, yLine)
      --print item data
    elseif sendermsg == string.match(sendermsg, "offerBItem: .*") then
      print("\n"..sendermsg.."\n")
    elseif sendermsg == string.match(sendermsg, "offerBDamage: .*") then
      print("\n"..sendermsg.."\n")
    elseif sendermsg == string.match(sendermsg, "offerBCount: .*") then
      print("\n"..sendermsg.."\n")
      --reboot
    elseif sendermsg == "reboot" then
      os.reboot()
    end
  end
end

while true do
  parallel.waitForAny(recv, send)
end
