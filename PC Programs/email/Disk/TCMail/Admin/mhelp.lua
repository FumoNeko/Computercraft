---@diagnostic disable: lowercase-global
print("Welcome to the TCMail Help Program. Here is the list of commands for your version:")
sleep( 1 )
print("1. mail\n2. mailreg\n3. mailreq\n4. emailreg\n5. rbt")
print("Type the command for more information about it. Type quit to quit this program.")
i = 1
while i == 1 do
    print("Enter command here: ")
    input = read()
    if input == "mail" then
        print("The mail command is the main interface for sending and receiving mail. If you have an awaiting mail message, and the mail server is online, it will show up here. This program will ask you if you would like to send an email. If you say yes, you will be taken to the mail sending screen.")
    end
    if input == "mailreg" then
        print("The mailreg command is used to register your computer as an entity with the main mail server. This allows other people to send you mail using your computer name, if it is set. If it is not set and you run this program, the server will automatically assign you a name. This has likely already been done however, as when TCMail Client boots, it runs a silent mail registration, and as such, sets the name. You can rename your computer by typing label set name (with name being the case sensitive name of your computer) after exiting TCMail Help.")
    end
    if input == "mailreq" then
        print("The mailreq command allows you to query the registration database for a computer or email entry. It will return a Nil Error if the database slot you asked for is empty.")
    end
    if input == "emailreg" then
        print("The emailreg program allows you to submit a custom name (which could be an email address, it doesn't really matter) to the server for registration of your computer. This is additional to the inbuilt computer label system present in TCMail. It will not rename your computer. Like the mailreg system, emailreg will not allow you to take someone else's name.")
    end
    if input == "rbt" then
        print("The Remote Boot Trigger (rbt) program functions as a additional reboot command for the server computer. Running this command will trigger the server's inbuilt reboot process, which saves all files it is working on, shuts down, and then reboots. If the server is hanging however, it will cause this computer to hang as well.")
    end
    if input == "quit" then
        i = 0
        print("Quitting TCMail Help.")
    end
end