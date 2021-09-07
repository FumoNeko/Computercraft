-----------------------------
--[    Network    ]--
-----------------------------
os.loadAPI("LANClient")
LANClient.connect("back", 449, "Palantir")




-----------------------------
--[    Main Program    ]--
-----------------------------


-- File Transfers over CRFv3.1

-- Packet structure:
-- [1] : Ident string
-- [2] : Action
-- [3] : Target
-- [4] : Data Parameter
-- [5] : Binary Flag

if not LANClient then
    error("LAN Client API not loaded.")
end

function readFile(server, file, binary)
    LANClient.send(server, textutils.serialize({"FileTransfer", "read", file, binary}))
    while true do
        local sender, data = LANClient.receive(5)
        if not sender then
            return false, "Server timed out"
        elseif sender == server then
            data = textutils.unserialize(data)
            if type(data) == "table" then
                if data[1] == "FileTransfer" then
                    if data[2] == "Error" then
                        return false, data[3]
                    elseif data[2] == "data" then
                        return true, data[3]
                    else
                        return false, "Unknown response"
                    end
                end
            end
        end
    end
end

function listFiles(server, dir)
    LANClient.send(server, textutils.serialize({"FileTransfer", "list", file}))
    local sender, data = LANClient.receive(5, server)
    if not sender then
        return false, "Server timed out"
    else
        data = textutils.unserialize(data)
        if type(data) == "table" then
            if data[1] == "FileTransfer" then
                if data[2] == "Error" then
                    return false, data[3]
                elseif data[2] == "list" then
                    return true, data[3]
                else
                    return false, "Unknown response"
                end
            end
        end
    end
end

function writeFile(server, file, data, binary)
    LANClient.send(server, textutils.serialize({"FileTransfer", "write", file, binary}))
    local sender, data = LANClient.receive(5, server)
    if not sender then
        return false, "Server timed out"
    else
        data = textutils.unserialize(data)
        if type(data) == "table" then
            if data[1] == "FileTransfer" then
                if data[2] == "Error" then
                    return false, data[3]
                elseif data[2] == "Okay" then
                    return true
                else
                    return false, "Unknown response"
                end
            end
        end
    end
end

function deleteFile(server, file)
    LANClient.send(server, textutils.serialize({"FileTransfer", "delete", file}))
    local sender, data = LANClient.receive(5, server)
    if not sender then
        return false, "Server timed out"
    else
        data = textutils.unserialize(data)
        if type(data) == "table" then
            if data[1] == "FileTransfer" then
                if data[2] == "Error" then
                    return false, data[3]
                elseif data[2] == "Okay" then
                    return true
                else
                    return false, "Unknown response"
                end
            end
        end
    end
end

function mkDir(server, dir)
    LANClient.send(server, textutils.serialize({"FileTransfer", "mkdir", dir}))
    local sender, data = LANClient.receive(5, server)
    if not sender then
        return false, "Server timed out"
    else
        data = textutils.unserialize(data)
        if type(data) == "table" then
            if data[1] == "FileTransfer" then
                if data[2] == "Error" then
                    return false, data[3]
                elseif data[2] == "Okay" then
                    return true
                else
                    return false, "Unknown response"
                end
            end
        end
    end
end

if shell then
    local file = fs.open(shell.getRunningProgram(), "r")
    if file then
        local l = file.readLine()
        file.close()
        if string.match(l, "File Transfers") then
            local args = {...}
            if #args == 0 then
                print("FTP -- File transfer interface and API")
                print(string.rep("-", term.getSize()))
                print("Usage: ftp [action] [server] [target] [params]")
                print("Actions:")
                print("read (\"ftp read [server] [remoteFile] [localFile]\"): Get a file.")
                print("write (\"ftp write [server] [localFile] [remoteFile]\"): Send a file.")
                print("mkdir (\"ftp mkdir [server] [remoteDir]\"): Make a directory.")
                print("delete (\"ftp delete [server] [remoteFile]\"): Delete a file.")
                print("list (\"ftp list [server] [remoteDir]\"): Get a directory listing.")
            elseif #args == 4 then
                if args[1] == "read" then
                    local stat, data = readFile(tonumber(args[2]), args[3], false)
                    if stat then
                        local f = fs.open(args[4], "w")
                        f.write(data)
                        f.close()
                        print("Data written to "..args[4])
                    else
                        print("Could not get file: "..data)
                    end
                elseif args[1] == "write" then
                    if fs.exists(args[3]) then
                        local f = fs.open(args[3], "r")
                        data = f.readAll()
                        f.close()
                        local stat, err = writeFile(tonumber(args[2]), args[4], data, false)
                        if stat then
                            print("File successfully transferred.")
                        else
                            print("Could not transfer file: "..err)
                        end
                    else
                        print("File does not exist: "..args[3])
                    end
                end
            elseif #args == 3 then
                if args[1] == "mkdir" then
                    local stat, err = mkDir(tonumber(args[2]), args[3])
                    if stat then
                        print("Directory successfully created.")
                    else
                        print("Could not make directory: "..err)
                    end
                elseif args[1] == "delete" then
                    local stat, err = deleteFile(tonumber(args[2]), args[3])
                    if stat then
                        print("File successfully deleted.")
                    else
                        print("Could not delete file: "..err)
                    end
                elseif args[1] == "list" then
                    local stat, list = listFiles(tonumber(args[2]), args[3])
                    if stat then
                        textutils.tabulate(list)
                    else
                        print("Could not get directory listing: "..err)
                    end
                end
            end
        end
    end
end
























-----------------------------
--[    Utility Functions   ]--
-----------------------------
--[[ saved as a utility tidbit for getting modems
-- checks sides and returns modem side
local function getModemSide()
  local sides = rs.getSides()
  local side = nil

  for i = 1, #sides do
    if peripheral.getType(sides[i]) == "modem" then
      side = sides[i]
    end
  end

  return side
end
]]
