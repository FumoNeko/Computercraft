---@diagnostic disable: lowercase-global
rednet.open("right")
rednet.broadcast("readmail")
a, messagep = rednet.receive(1)
if messagep == null then
else
print("You've Got Mail!")
print("------------------")
print(messagep)
end
print("Do you want to send mail?")
input = read()
if input == "yes" then
rednet.broadcast("sendmail")
write("To: (Name, ID, or email address) ")
input = read()
rednet.broadcast(input)
if os.getComputerLabel() == nil then
name = "Unknown"
else
name = os.getComputerLabel()
end
print("From: " .. name)
rednet.broadcast(name)
print("Message body:")
input = read()
rednet.broadcast(input)
end