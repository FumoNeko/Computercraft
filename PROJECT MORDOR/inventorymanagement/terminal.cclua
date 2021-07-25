--pastebin code: G47j7rDW

local bridge = peripheral.wrap("left")
local net = peripheral.wrap("back")

bridge.clear()

local width = 100

local storageUnits = {
   {
         ["id"] = "cofh_thermalexpansion_energycell_0",
         ["name"] = "Main"
   },
   {
         ["id"] = "cofh_thermalexpansion_energycell_1",
         ["name"] = "Backup"
   },
   {
         ["id"] = "harvester_0",
         ["name"] = "Tree Farm"
   },
   {
         ["id"] = "planter_0",
         ["name"] = "Planter"

   }
}

local offset = 0
for key, storageUnit in pairs(storageUnits) do
  if net.getTypeRemote(storageUnit["id"]) == "cofh_thermalexpansion_energycell" then
   pxOffset = offset * 20
   storageUnit["label"] = bridge.addText(4, 4 + pxOffset, storageUnit["name"], 0xffffff)
   storageUnit["bar"] = bridge.addBox(4, 14 + pxOffset, 0, 5, 0xCC0000, 0.9)
   storageUnit["bar"].setZ(2)
   storageUnit["bg"] = bridge.addBox(4, 14 + pxOffset, width, 5, 0x000000, 0.5)
   storageUnit["num"] = bridge.addText(4, 24 + pxOffset, "0/0", 0xffffff)
   storageUnit["percent"] = bridge.addText(0 + bridge.getStringWidth(storageUnit["name"]), 4 + pxOffset, "##%", 0xffffff)
   offset = offset + 2
  elseif net.getTypeRemote(storageUnit["id"]) == "harvester" then
   pxOffset = offset * 10
   storageUnit["label"] = bridge.addText(4, 34 + pxOffset, storageUnit["name"].." :", 0xffffff)
   storageUnit["run"] = bridge.addText(0 + bridge.getStringWidth(storageUnit["name"]), 34 + pxOffset, "", 0xffffff)
   offset = offset + 1
  elseif net.getTypeRemote(storageUnit["id"]) == "planter" then
   pxOffset = offset * 10
   storageUnit["label"] = bridge.addText(4, 44 + pxOffset, storageUnit["name"].." :", 0xffffff)
   storageUnit["run"] = bridge.addText(0 + bridge.getStringWidth(storageUnit["name"]), 44 + pxOffset, "", 0xffffff)
   offset = offset + 1
  end
end

while true do
  for i=#storageUnits,1,-1 do
        storageUnit = storageUnits[i]
        if net.isPresentRemote(storageUnit["id"]) then
          if net.getTypeRemote(storageUnit["id"]) == "cofh_thermalexpansion_energycell" then
            t = peripheral.wrap(storageUnit["id"])
            capacity = t.getMaxEnergyStored("")
            amount = t.getEnergyStored("")
            storageUnit["bar"].setWidth(width / capacity * amount)
            perc = math.floor(amount/capacity * 100)
            tCap = tostring(capacity)
            tAmt = tostring(amount)
            tPerc = tostring(perc)
            storageUnit["num"].setText(tAmt.."/"..tCap)
            storageUnit["percent"].setText(tPerc.."%")
          elseif net.getTypeRemote(storageUnit["id"]) == "harvester" or net.getTypeRemote(storageUnit["id"]) == "planter" then
            t = peripheral.wrap(storageUnit["id"])
                running = t.isActive()
                  if running == true then
                    storageUnit["run"].setText("Running")
              storageUnit["run"].setColor(0x33cc33)
              --storageUnit["label"].setText(storageUnit["name"]..": Running")

                  else
                    storageUnit["run"].setText("Not Running")
              storageUnit["run"].setColor(0xff0000)
                    --storageUnit["label"].setText(storageUnit["name"]..": Not Running")
            end
            end
        else
         if net.getTypeRemote(storageUnit["id"]) == "cofh_thermalexpansion_energycell" then
              storageUnit["bar"].delete()
          storageUnit["bg"].delete()
          storageUnit["label"].delete()
          storageUnit["num"].delete()
          storageUnit["percent"].delte()
              table.remove(storageUnits, i)
            elseif net.getTypeRemote(storageUnit["id"]) == "harvester" or net.getTypeRemote(storageUnit["id"]) == "planter" then
              storageUnit["label"].delete()
              storageUnit["run"].delete()
              table.remove(storageUnits, i)
             end
        end
  end
  sleep(0.5)
end
