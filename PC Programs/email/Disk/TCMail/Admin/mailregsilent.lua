rednet.open("right")
rednet.broadcast("register")
if os.getComputerLabel() == nil then
    name = "Unknown"
else
    name = os.getComputerLabel()
end
rednet.broadcast(name)
if message == "reged" then
    id, message = rednet.receive()
    name = message
    os.setComputerLabel(name)
end