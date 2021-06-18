print("Hello, and welcome to the TCMail installer.")
file = fs.open("/disk/TCMail/Client/startup", "r")
a = file.readAll()
s = (tostring(a))
file.close()
sleep( 1 )
print("Which type of installation would you like to run? \nOptions are:\n1. Client - Install if you are a standard user.\n2. Server - Install if this computer is the mail server.\n3. Admin - Client install with server control utilities.\n4. Quit - If you want to quit.\nTYPE ONLY THE NAME, CASE SENSITIVE!")
input = read()
if input == "Server" then
    print("Copying Server files to the computer. Do not turn off the power.")
    print("Copying Startup file...")
    fs.delete("/startup")
    fs.copy("/disk/TCMail/Server/startup", "/startup")
    sleep( 1 )
    print("Copying Reboot file...")
    fs.delete("/reboot")
    fs.copy("/disk/TCMail/Server/reboot", "/reboot")
    sleep( 1 )
    print("Copying Server Runtime...")
    fs.delete("/mailserv")
    fs.copy("/disk/TCMail/Server/mailserv", "/mailserv")
    sleep( 1 )
    print("Installation completed. Please allow this program to exit and then take your floppy disk to use somewhere else.")
    sleep( 3 )
    print("Closing Active Files")
    sleep( 1 )
    print("Exiting TCMail installation...")
    sleep( 1 )
    print("...")
    sleep( 1 )
    print("...")
    sleep( 1 )
    print("...")
    sleep( 1 )
    shell.run("reboot")
end
if input == "Client" then
    print("Copying Client files to the computer. Do not turn off the power.")
    print("Copying Startup file...")
    if fs.exists("/startup") then
        file = fs.open("/startup", "r")
        d = file.readAll()
        file.close()
        f = tostring(d)
        if f == s then
            print("Detected Existing TCMail Startup File, overwriting...")
            fs.delete("/startup")
            fs.copy("/disk/TCMail/Client/startup", "/startup")
            sleep( 1 )
        else
            print("There appears to already be an Operating System installed on this computer, shown by the presence of a startup file. If you would like, TCMail can be installed alongside this Operating System, by appending TCMail's startup code to that of your OS. Would you like to do this? (yes/no/quit)")
            input = read()
            if input == "yes" then
                print("Appending Startup Code")
                print("Opening Startup File")
                file = fs.open("/startup", "a")
                print("Writing Code")
                file.write(s)
                print("Writing Completed, closing file and continuing with the rest of the installation.")
                file.close()
            end
            if input == "quit" then
                print("Installation cancelled. Please allow this program to exit and then take your floppy disk to use somewhere else.")
                sleep( 3 )
                print("Closing Active Files")
                sleep( 1 )
                print("Exiting TCMail installation...")
                sleep( 1 )
                print("...")
                sleep( 1 )
                print("...")
                sleep( 1 )
                print("...")
                sleep( 1 )
                shell.run("reboot")
            end
            if input == "no" then
                print("Deleting the startup file and continuing with installation.")
                fs.delete("/startup")
                fs.copy("/disk/TCMail/Client/startup", "/startup")
                sleep( 1 )
            end
        end
    else
        fs.delete("/startup")
        fs.copy("/disk/TCMail/Client/startup", "/startup")
        sleep( 1 )
    end
    print("Copying Mail Program...")
    fs.delete("/mail")
    fs.copy("/disk/TCMail/Client/mail", "/mail")
    sleep( 1 )
    print("Copying Mail Registation Program...")
    fs.delete("/mailreg")
    fs.copy("/disk/TCMail/Client/mailreg", "/mailreg")
    sleep( 1 )
    print("Copying Silent Registration Program...")
    fs.delete("/mailregsilent")
    fs.copy("/disk/TCMail/Client/mailregsilent", "/mailregsilent")
    sleep( 1 )
    print("Copying Database Query Program...")
    fs.delete("/mailreq")
    fs.copy("/disk/TCMail/Client/mailreq", "/mailreq")
    sleep( 1 )
    print("Copying Email Registration Program...")
    fs.delete("/emailreg")
    fs.copy("/disk/TCMail/Client/emailreg", "/emailreg")
    sleep( 1 )
    print("Copying TCMail Client Help Program...")
    fs.delete("/mhelp")
    fs.copy("/disk/TCMail/Client/mhelp", "/mhelp")
    sleep( 1 )
    print("Installation completed. Please allow this program to exit and then take your floppy disk to use somewhere else.")
    sleep( 3 )
    print("Closing Active Files")
    sleep( 1 )
    print("Exiting TCMail installation...")
    sleep( 1 )
    print("...")
    sleep( 1 )
    print("...")
    sleep( 1 )
    print("...")
    sleep( 1 )
    shell.run("reboot")
end
if input == "Admin" then
    print("Copying Admin files to the computer. Do not turn off the power.")
    print("Copying Startup file...")
    fs.delete("/startup")
    fs.copy("/disk/TCMail/Admin/startup", "/startup")
    sleep( 1 )
    print("Copying Mail Program...")
    fs.delete("/mail")
    fs.copy("/disk/TCMail/Admin/mail", "/mail")
    sleep( 1 )
    print("Copying Mail Registation Program...")
    fs.delete("/mailreg")
    fs.copy("/disk/TCMail/Admin/mailreg", "/mailreg")
    sleep( 1 )
    print("Copying Silent Registration Program...")
    fs.delete("/mailregsilent")
    fs.copy("/disk/TCMail/Admin/mailregsilent", "/mailregsilent")
    sleep( 1 )
    print("Copying Database Query Program...")
    fs.delete("/mailreq")
    fs.copy("/disk/TCMail/Admin/mailreq", "/mailreq")
    sleep( 1 )
    print("Copying Email Registration Program...")
    fs.delete("/emailreg")
    fs.copy("/disk/TCMail/Admin/emailreg", "/emailreg")
    sleep( 1 )
    print("Copying TCMail Admin Help Program...")
    fs.delete("/mhelp")
    fs.copy("/disk/TCMail/Admin/mhelp", "/mhelp")
    sleep( 1 )
    print("Copying Server Admin Remote Reboot Program...")
    fs.delete("/rbt")
    fs.copy("/disk/TCMail/Admin/rbt", "/rbt")
    sleep( 1 )
    print("Installation completed. Please allow this program to exit and then take your floppy disk to use somewhere else.")
    sleep( 3 )
    print("Closing Active Files")
    sleep( 1 )
    print("Exiting TCMail installation...")
    sleep( 1 )
    print("...")
    sleep( 1 )
    print("...")
    sleep( 1 )
    print("...")
    sleep( 1 )
    shell.run("reboot")
end
if input == "Quit" then
    print("Installation cancelled. Please allow this program to exit and then take your floppy disk to use somewhere else.")
    sleep( 3 )
    print("Closing Active Files")
    sleep( 1 )
    print("Exiting TCMail installation...")
    sleep( 1 )
    print("...")
    sleep( 1 )
    print("...")
    sleep( 1 )
    print("...")
    sleep( 1 )
    shell.run("reboot")
end
