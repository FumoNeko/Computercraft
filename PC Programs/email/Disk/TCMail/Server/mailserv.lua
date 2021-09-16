---@diagnostic disable: deprecated, lowercase-global
print("Running eMail server")
-- Loading Code Begin
n=0
a=0
local table1={}
if fs.exists("table1.txt") == true then
    hHandle = fs.open("table1.txt", "r")
    repeat
        line = hHandle.readLine()
        if line == nil then
        else
            print("Name: " .. line)
            table.insert(table1, line)
            print("Added name to database")
            a = a+1
            line2 = hHandle.readLine()
            table1[line]=line2
            print(line2)
            print("Tied ID to name in database")
            a = a+1
            n = n+1
        end
    until line == nil
    -- Loading Code Loop End
    hHandle.close()
else
    print("Table Text File does not exist. Will check next reboot.")
end
-- Loading Code Finished, close handles.
rednet.open("right")
while true do
    id, message = rednet.receive()
    if message == "con" then
        rednet.broadcast("Computer " .. id .. " connected to the BBS")
        print("Computer " .. id .. " connected to the BBS via Modem.")
    end
    if message == "reboot" then
        print("Rebooting...")
        rednet.broadcast("rebooted")
        shell.run("reboot")
    end
    if message == "readmail" and fs.exists(id) then
        mail = fs.open(id, "r")
        print("Computer " .. id .. " read his Mail.")
        readmail = mail.readAll()
        rednet.broadcast(readmail)
        mail.close()
        fs.delete(id)
    end
    if message == "sendmail" then
        id1, i = rednet.receive()
        if tonumber(i) ~= nil then
            to = i
        else
            to = table1[i]
        end
    end
    if to == nil then
    else
        mail = fs.open(to, "w")
        id2, from = rednet.receive()
        mail.writeLine("From: " .. from .. "-" .. id1)
        mail.writeLine("Contents:")
        id3, tm = rednet.receive()
        mail.write(tm)
        mail.close()
        print("Computer " .. from .. "-" .. id1 .. " sent Mail to " .. i .. "-" .. to)
    end
    if message == "register" then
        id, regname = rednet.receive()
        if regname == "Unknown" then
        regname = tostring("Unknown" .. n)
        end
        if table1[regname] == nil then
            table.insert(table1,regname)
            table1[regname]=id
            print("Computer " .. table1[regname])
            print("registered as name " .. table1[n+1])
            print(table.maxn(table1))
            if fs.exists("table1.txt") == true then
                local hHandle = fs.open("table1.txt", "r")
                i = hHandle.readLine()
                hHandle.close()
            else
                i = nil
            end
            local file = fs.open("table1.txt", "a") -- open the file
            if file then -- check if it's open
                if i == nil then
                    s = tostring(table1[n+1]) -- serialize the table, so we have a string to save to the file
                else
                    s = tostring("\n" .. table1[n+1]) -- serialize the table, so we have a string to save to the file
                end
                file.write(s) -- write it to the file
                local s = tostring("\n" .. table1[regname]) -- serialize the table, so we have a string to save to the file
                file.write(s) -- write it to the file
                file.close() -- always close the file handles
            end
         n = n+1
            rednet.broadcast("reged")
            rednet.broadcast(regname)
        else
            rednet.broadcast("denyreg")
            print(regname .. " was denied registration. Username already exists.")
        end
    end
    if message == "emailreg" then
        id, regname = rednet.receive()
        if table1[regname] == nil then
            table.insert(table1,regname)
            table1[regname]=id
            print("Computer " .. table1[regname] .. " registered as email " .. table1[n+1])
            print(table.maxn(table1))
            if fs.exists("table1.txt") == true then
                local hHandle = fs.open("table1.txt", "r")
                i = hHandle.readLine()
                hHandle.close()
            else
                i = nil
            end
            local file = fs.open("table1.txt", "a") -- open the file
            if file then -- check if it's open
                if i == nil then
                    s = tostring(table1[n+1]) -- serialize the table, so we have a string to save to the file
                else
                    s = tostring("\n" .. table1[n+1]) -- serialize the table, so we have a string to save to the file
                end
                file.write(s) -- write it to the file
                local s = tostring("\n" .. table1[regname]) -- serialize the table, so we have a string to save to the file
                file.write(s) -- write it to the file
                file.close() -- always close the file handles
            end
        n = n+1
            rednet.broadcast("reged")
        else
            rednet.broadcast("denyreg")
            print(regname .. " was denied registration. Username already exists.")
        end
    end
    if message == "reglist" then
        id, reg1 = rednet.receive()
        reg = tonumber(reg1)
        if reg > table.maxn(table1) then
        rednet.broadcast("Nil Error")
        rednet.broadcast("Nil Error")
        print("Received invalid database request from " .. id)
        else
            print("Receiving Number " .. reg .. " Database Query request from " .. id)
            if table1[reg] == nil then
                i = "Nil Error"
                f = "Nil Error"
            else
                i = table1[reg]
                f = table1[i]
                print("Listing:")
                print("Name: " .. table1[reg])
                print("ID: " .. table1[i])
            end
            print("Sending Name " .. i)
            rednet.send(id, i)
            print("Sending ID " .. f)
            rednet.send(id, tostring(f))
            print("Computer has been sent requested listing.")
        end
    end
end