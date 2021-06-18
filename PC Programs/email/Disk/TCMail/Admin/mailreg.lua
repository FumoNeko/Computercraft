rednet.open("right")
rednet.broadcast("register")
print("Registering ID with the server...")
sleep( 1 )
print("Registering Name with the server...")
if os.getComputerLabel() == nil then
    name = "Unknown"
else
    name = os.getComputerLabel()
end
rednet.broadcast(name)
id, message = rednet.receive()
print("Registration Server Response: " .. message)
if message == "reged" then
    id, message = rednet.receive()
    name = message
    print("Successfully Registered with the server as ID " .. os.getComputerID() .. " with name " .. name)
    os.setComputerLabel(name)
    print("Computer Name set to " .. name)
else
    print ("Registration Unsuccessful")
end