print("Would you like to register an email with the server?")
input = read()
if input == "yes" then
print("Type the email address you would like to use, @ symbol included.")
input = read()
email = input
rednet.open("right")
rednet.broadcast("emailreg")
rednet.broadcast(email)
id, message = rednet.receive()
print("Registration Server Response: " .. message)
if message == "reged" then
print("Successfully Registered with the server as email " .. email .. " with ID " .. os.getComputerID())
else
print ("Registration Unsuccessful")
end
end