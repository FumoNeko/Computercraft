-- File Transfers over CRFv3.1

--[[
Packet structure:
rednet.send(id, {1, 2, 3, 4}, "protocol")
[1] : Ident string
[2] : Action
[3] : Target
[4] : Data Parameter

Protocols:
ftp_connect
ftp_list
ftp_get
ftp_put
ftp_delete
]]


--[ Network ]--
rednet.open("back")
-----------------------------
--[ Functions ]--
-----------------------------
local function split(string, delimiter)
  result = {}
  for token in string.gmatch(string, "%a+") do
    table.insert(result, token)
  end
  return result
end

local function clearScreen()
  term.clear()
  term.setCursorPos(1, 1)
end

local function printUsage()
  print("Usage: ")
  print("clear")
  print("connect <server name>")
  print("ls")
  print("get <file name>")
  print("put <file name>")
  print("delete <file name>")
  print("exit")
end

local function main()
-----------------------------
      --[ Input ]--
-----------------------------
  local menu = true
  while menu == true do
    local server_id = 0
    write("ftp>")
    local input = read()
    local args = {}
    args = split(input, " ")
    local cmd = args[1]
    table.remove(args, 1)
    --  commands = {"clear", "connect", "ls", "get", "put", "delete", "exit"}

    -----------------------------
      --[ Process/Output ]--
    -----------------------------
    if cmd == "clear" then
      clearScreen()

    elseif cmd == "connect" then
      server_name = args[1]
      server_id = rednet.lookup("ftp", server_name)
      print("server id : ", server_id)

    elseif cmd == "put" then
      filename = args[1]
      file = fs.open(filename, "r")
      filedata = {}

      if file == nil then
        print("File not found.")
      else
        repeat
          line = file.readLine()
          table.insert(filedata, line)
        until line == nil
        print("sending to: ", server_id)
        rednet.send(server_id, filedata, "put")
        rednet.send(server_id, filename, "ftp_name")
      end

    elseif cmd == "ls" then
      rednet.send(server_id, "", "ftp_list")
      local senderId, message = rednet.receive(2)

      if senderId == server_id then
        i = 1
        repeat
          line = message[i]
          print(line)
          i = i + 1
        until line == nil
      else
        print("Not connected to an ftp server")
      end

    elseif cmd == "get" then
      filename = args[1]
      rednet.send(server_id, "", "get")
      rednet.send(server_id, filename, "ftp_name")
      print("waiting")
      local id, msg, protocol = rednet.receive("get")
      print("received")
      if msg == "file doesn't exist" then
        print(msg)
        --elseif fs.exists(filename) == true then
        --    print("file already exists with that name")
      elseif protocol == "get" then
        local file = fs.open(filename, "w")
        i = 1
        repeat
          local line = msg[i]
          print(line)
          file.writeLine(line)
          i = i + 1
        until line == nil
        file.close()
      end

    elseif cmd == "delete" then
      filename = args[1]
      rednet.send(server_id, "", "delete")
      rednet.send(server_id, filename, "ftp_name")
      local id, msg = rednet.receive("delete")
      print(msg)

    elseif cmd == "exit" then
      print("Goodbye.")
      do return end

    elseif cmd == "help"
      printUsage()
    else
      print("Unknown Command")
      printUsage()
    end -- ends if statement
  end -- ends while loop
end -- ends function
main()
--[[
-----------------------------
--[ Input ]--
-----------------------------
print("What file will you send?")
local filename = read()
fs.makeDir("saves")
local file = fs.open("saves/"..filename, "r")
local filedata = {}
-----------------------------
--[ Process ]--
-----------------------------
--sending file
repeat
  local line = file.readLine()
  table.insert(filedata, line)
until line == nil
-----------------------------
--[ Output ]--
-----------------------------
rednet.send(1, filedata, "ftp_send")
]]
