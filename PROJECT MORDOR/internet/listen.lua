os.loadAPI("LANClient")
os.loadAPI("modem_emulator")
LANClient.connect("back", 455, "Palantir")
modem_emulator.register_modem("front")
