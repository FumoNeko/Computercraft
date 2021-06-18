rednet.open("right")
rednet.broadcast("reboot")
print("Rebooting Remote Server...")
id, i = rednet.receive()
if i == "rebooted" then
print("Server " .. id .. " Reboot Successful.")
end
