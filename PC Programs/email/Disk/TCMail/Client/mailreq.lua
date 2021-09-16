---@diagnostic disable: lowercase-global
rednet.open("right")
rednet.broadcast("reglist")
print("Querying Server...")
print("Enter Database Position Number:")
input = read()
rednet.broadcast(input)
print("Sending request to the Server...")
id1, msgn = rednet.receive()
id2, i = rednet.receive()
if i == "Nil Error" then
msgid = i
else
msgid = tonumber(i)
end
print("Registration Server Response:")
print("Name: " .. msgn)
print("ID: " .. msgid)