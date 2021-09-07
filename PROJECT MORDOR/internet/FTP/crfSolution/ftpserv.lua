--[[
Program scope
host a server, Client-server model
The server "hosts" the filesystem which will primarily be where interactions take place
The client sends and receives files based on this filesystem.
The client can download and upload files to a hardcoded directory on the server, and also make directories
client commands would be: read file, write file, delete file, make directory(mkDir) and listDir
It would be nice to print working directory as the command prefix such as ftp://servername/ftp/...>
]]


-----------------------------
--[    Network    ]--
-----------------------------
os.loadAPI("LANClient")
os.loadAPI("ftp")
LANClient.connect("back", 449, "Palantir")

-- File Transfer Server over CRFv3.1

-- Packet structure:
-- [1] : Ident string
-- [2] : Action
-- [3] : Target
-- [4] : Parameter 1
-- [5] : Parameter 2

local args = {...}

local filePath = "server/"

-- Standard error messages:
local e_noexist = textutils.serialize({"FileTransfer", "Error", "File does not exist"})
local e_exist = textutils.serialize({"FileTransfer", "Error", "File already exists"})
local e_isdir = textutils.serialize({"FileTransfer", "Error", "File is a directory"})
local e_hasdata = textutils.serialize({"FileTransfer", "Error", "Directory contains files"})
-- Not an error message:
local m_okay = textutils.serialize({"FileTransfer", "Okay"})

if not LANClient then
    error("LAN Client API not loaded.")
end

while true do
    local sender, data = LANClient.receive()
    data = textutils.unserialize(data)
    if type(data) == "table" then
        if data[1] == "FileTransfer" then
            if data[2] == "read" then
                if not fs.exists(data[3]) then
                    LANClient.send(sender, e_noexist)
                else
                    if data[4] then -- Binary flag
                        local f = fs.open(data[3], "rb")
                        local bytes = {}
                        local lastPause = os.clock()
                        while true do
                            local byte = f.read()
                            if not byte then
                                break
                            else
                                table.insert(bytes, byte)
                            end
                            if (os.clock() - lastPause) >= 2.90 then
                                os.queueEvent("")
                                os.pullEvent("")
                                lastPause = os.clock()
                            end
                        end
                        f.close()
                        LANClient.send(sender, textutils.serialize({"FileTransfer", "data", bytes}))
                    else
                        local f = fs.open(data[3], "r")
                        local text = f.readAll()
                        f.close()
                        LANClient.send(sender, textutils.serialize({"FileTransfer", "data", text}))
                    end
                end
            elseif data[2] == "write" then
                if data[5] then
                    local f = fs.open(data[3], "wb")
                    local lastPause = os.clock()
                    for i=1, #data[4] do
                        f.write(data[4][i])
                        if (os.clock() - lastPause) >= 2.90 then
                            os.queueEvent("")
                            os.pullEvent("")
                            lastPause = os.clock()
                        end
                    end
                    f.close()
                    LANClient.send(sender, m_okay)
                else
                    local f = fs.open(data[3], "w")
                    f.write(data[4])
                    f.close()
                    LANClient.send(sender, m_okay)
                end
            elseif data[2] == "mkdir" then
                if fs.exists(data[3]) then
                    LANClient.send(sender, e_exist)
                else
                    fs.makeDir(data[3])
                    LANClient.send(sender, m_okay)
                end
            elseif data[2] == "delete" then
                if not fs.exists(data[3]) then
                    LANClient.send(sender, e_noexist)
                else
                    fs.delete(data[3])
                    LANClient.send(sender, m_okay)
                end
            elseif data[2] == "list" then
                if not fs.exists(data[3]) then
                    LANClient.send(sender, e_noexist)
                else
                    LANClient.send(sender, textutils.serialize({"FileTransfer", "list", fs.list(data[3])}))
                end
            end
        end
    end
end
