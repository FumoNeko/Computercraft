local localChannel=666
local rest={x=156,y=7,z=263}
local drop={x=160,y=6,z=264}

local chests={
    {chest=peripheral.wrap("chest_0"),pos={x=1087,y=65,z=381}},
    {chest=peripheral.wrap("chest_1"),pos={x=1087,y=65,z=384}},
    {chest=peripheral.wrap("chest_2"),pos={x=1087,y=65,z=387}},
    {chest=peripheral.wrap("chest_3"),pos={x=1081,y=65,z=381}},
    {chest=peripheral.wrap("chest_4"),pos={x=1081,y=65,z=384}},
    {chest=peripheral.wrap("chest_5"),pos={x=1081,y=65,z=387}},
}

local modem=peripheral.wrap("bottom")
local wireless=peripheral.wrap("top")


if fs.exists("event")==false then shell.run("pastebin get UKPy4iiE event") end
os.loadAPI("event")

if fs.exists("utils")==false then shell.run("pastebin get dyvydHtK utils") end
os.loadAPI("utils")

if fs.exists("data")==false then shell.run("pastebin get LnvzL7ur data") end
if os.loadAPI("data")==false then error("Failed to load data API") end

local taskQue = {}

local turtles = {}

local craftQue = {}


local modems={}
modem.open(localChannel)
modems["back"]=modem
modems["wired"]=modem
wireless.open(localChannel)
modems["bottom"]=wireless
modems["wireless"]=wireless

local pingLimit = 10
local items={}
local turtleTimer = os.startTimer(10)

function indexItems()
    items={}
    for chestID,chest in pairs(chests) do
        for i,stack in pairs(chest.chest.getAllStacks()) do
            local data=stack.all()
            if items[string.lower(data.display_name)]==nil then
                items[string.lower(data.display_name)]={[chestID]=data.qty}
            else
                if items[string.lower(data.display_name)][chestID]==nil then
                    items[string.lower(data.display_name)][chestID]=data.qty
                else
                    items[string.lower(data.display_name)][chestID]=items[string.lower(data.display_name)][chestID]+data.qty
                end
            end
        end
    end
end
indexItems()

function getItemCount(name)
    local item=items[string.lower(name)]
    if item==nil then return 0 end
    local count=0
    for chestID,itemCount in pairs(item) do
        count=count+itemCount
    end
    return count
end

function getItemPosition(name,count)
    local item=items[string.lower(name)]
    if item==nil then return end
    local positions={}
    if count==0 then
        count=1
    end
    local remainder=count
    for chestID,itemCount in pairs(item) do
        remainder=remainder-itemCount
        positions[#positions+1]={pos=chests[chestID].pos,count=itemCount}
        if remainder<=0 then
            return positions
        end
    end
    return positions
end

function getIdleTurtle()
    for id,turtle in pairs(turtles) do
        if turtle.status=="idle" then
            return turtle
        end
    end
    return nil
end

function statusUpdate(channel,turtle,previous,new)
    --print("Que:\n"..textutils.serialise(taskQue))
    event.handleCCEvents(0.05)
    if new=="idle" then
        turtle.task=nil
        if #taskQue==0 then
            if #craftQue == 0 then return end
            indexItems()
            for i,queEntry in ipairs(craftQue) do
                if craftItem(queEntry.item,queEntry.count,true) == true then
                    craftItem(queEntry.item,queEntry.count,nil,queEntry.final)
                    craftQue[i]=nil
                    for j=i+1,#craftQue do
                        craftQue[j-i]=craftQue[j]
                    end
                    craftQue[#craftQue]=nil
                    return
                end
            end
            return
        end
        modems["wireless"].transmit(channel,localChannel,taskQue[1])
        turtle.task=taskQue[1]
        turtle.status="working"
        for id,data in ipairs(taskQue) do
            taskQue[id-1]=data
        end
        taskQue[0]=nil
        taskQue[#taskQue]=nil
    end
end
event.addHandler("onTurtleStatusChange",statusUpdate)

function turtleTimed(turtle,channel)
    local command = turtle.task
    if command == nil then return end
    local turtle=getIdleTurtle()
    if turtle==nil then
        taskQue[#taskQue+1]=command
    else
        modems["wireless"].transmit(turtle.channel,localChannel,command)
        turtle.task=command
        turtle.status="working"
    end
end
event.addHandler("onTurtleTimeout",turtleTimed)

function createRecipe(targetItem,recipeString)
    data.set(targetItem,recipeString)
end

function checkTurtleConnectionTimer(timer)
    if timer ~= turtleTimer then return end
    for channel,turtle in pairs(turtles) do
        if turtle.lastMessage < os.clock() - 20 then
            turtle.missed = turtle.missed + 1
            if turtle.missed > pingLimit then
                print("Turtle " .. channel .. " has timed out")
                event.trigger("onTurtleTimeout",turtle,channel)
                turtles[channel] = nil
                checkTurtleConnectionTimer(timer)
                break
            end
        else
            turtle.missed = 0
        end
    end
    --[[
    for channel,turtle in pairs(turtles) do
        if turtle.timer == timer then
            ping(channel)
            if turtle.pingTimer == nil then
                turtle.missed = 0
                turtle.pingTimer = os.startTimer(10)
            end
        elseif turtle.pingTimer == timer  and turtle.missed == pingLimit then
            --print("Turtle " .. channel .. " has timed out")
            event.trigger("onTurtleTimeout",turtle,channel)
            turtles[channel] = nil
            return
        elseif turtle.pingTimer == timer and turtle.missed then
            turtle.pingTimer = os.startTimer(10)
            turtle.missed = turtle.missed + 1
        end
    end
    ]]
    turtleTimer = os.startTimer(10)
end
event.addHandler("timer",checkTurtleConnectionTimer)

function craftItem(itemName,count,check,final)
    indexItems()
    local hasSubs = false
    local recipe = data.get(itemName,"db/recipes")
    if recipe==nil or recipe=="nil" then return end
    local command = "craft|"..count.."|"
    if final == nil or final == false then
        command = "innerCraft|"..count.."|"
    end
    print(itemName .." : " .. count)
    for i=1,9 do
        local item = utils.split(recipe,";",i)
        local positions = getItemPosition(item,count)
        local itemFound = false
        if item~=nil and positions ~=nil then
            local remainder=count
            for chestID,data in pairs(positions) do
                local count=data.count
                if count>=remainder then
                    command = command .. item ..";".. data.pos.x ..",".. data.pos.y ..",".. data.pos.z .. ";"..i.."|"
                    itemFound = true
                    break
                end
            end
            if itemFound == false then
                if data.get(item,"db/recipes")~=nil then
                    if check == nil then
                        craftItem(item,count,nil,false)
                    end
                    hasSubs = true
                end
            end
        elseif positions == nil and item ~= nil and item ~= ""  then
            print("item not found in system "..tostring(item).." Recipe: "..tostring(not ( data.get(item,"db/recipes") == nil ) ) )
            if data.get(item,"db/recipes")~=nil then
                if check == nil then
                    craftItem(item,count,nil,false)
                elseif check ~= false then
                    return false
                end
                hasSubs = true
            else
                print("Not enough items")
            end
        end
    end

    if hasSubs == true then
        craftQue[#craftQue+1] = { item = itemName, count = count, final = final }
    end

    if check == true and hasSubs == false then
        return true
    elseif check == true then
        return false
    end
    local turtle = getIdleTurtle()
    if turtle==nil then
        craftQue[#craftQue+1] = { item = itemName, count = count, final = final }
        --taskQue[#taskQue+1]=command
    else
        modems["wireless"].transmit(turtle.channel,localChannel,command)
        turtle.task=command
        turtle.status="working"
    end
    print(textutils.serialise(craftQue))
end

function ping(channel)
    modems.wireless.transmit(channel,localChannel,"ping")
end

local messageHandles={
    ["ping"]=function(replyChannel,message)
        if turtles[replyChannel]==nil then return end
        event.trigger("onPing",replyChannel)
        return "pong"
    end,

    ["pong"]=function(replyChannel,message)
        if turtles[replyChannel]==nil then return end
        event.trigger("onPong",replyChannel)
    end,

    ["getItemCount"]=function(replyChannel,message)
        indexItems()
        local itemName=utils.split(message,"|",2)
        return "returnItemCount|"..getItemCount(itemName)
    end,

    ["requestItemList"]=function(replyChannel,message)
        indexItems()
        local itemString=""
        for itemname,chests in pairs(items) do
            itemString=itemString..itemname..","..getItemCount(itemname)..";"
        end
        return "returnItemList|"..itemString
    end,

    ["requestTurtles"]=function(replyChannel,message)
        local turtleString=""
        for channel,turtle in pairs(turtles) do
            turtleString=turtleString..channel..","..turtle.status..","..tostring(turtle.task)..";"
        end
        return "returnTurtles|"..turtleString
    end,

    ["requestQue"]=function(replyChannel,message)
        local queString=""
        for _,queCommand in pairs(taskQue) do
            queString=queString..string.gsub(queCommand,"|",";").."|"
        end
        return "returnQue|"..queString
    end,

    ["requestItem"]=function(replyChannel,message)
        indexItems()
        local itemName=utils.split(message,"|",2)
        local count=tonumber(utils.split(message,"|",3))
        --print("Item request: "..itemName.."x"..count)
        local positions=getItemPosition(itemName,count)
        local remainder=count
        if positions==nil then return end
        for chestID,data in pairs(positions) do
            ----print(chestID)
            local count=data.count
            if count>remainder then
                count=remainder
            end
            remainder=remainder-count
            local command="get|"..itemName.."|"..count.."|"..data.pos.x..","..data.pos.y..","..data.pos.z
            --print("Command: "..command)
            local turtle=getIdleTurtle()
            if turtle==nil then
                taskQue[#taskQue+1]=command
            else
                modems["wireless"].transmit(turtle.channel,localChannel,command)
                turtle.task=command
                turtle.status="working"
            end
            if remainder<=0 then
                return
            end
        end
    end,

    ["addRecipe"]=function(replyChannel,message)
        local item = utils.split(message,"|",2)
        local recipe = utils.split(message,"|",3)
        data.set(item,recipe,"db/recipes")
        --print("Adding recipe: "..recipe)
    end,

    ["requestRecipes"]=function(replyChannel,message)
        local returnString = "returnRecipes|"
        for id,_ in pairs(data.getAll("db/recipes")) do
            returnString = returnString .. id .. ";"
        end
        return returnString
    end,

    ["requestCraft"]=function(replyChannel,message)
        local itemName=utils.split(message,"|",2)
        local count=tonumber(utils.split(message,"|",3))
        craftItem(itemName,count,nil,true)
    end,

    ["getItemPosition"]=function(replyChannel,message)
        indexItems()
        local itemName=utils.split(message,"|",2)
        local posString=""
        local positions=getItemPosition(itemName)
        if positions==nil then return end
        for _,pos in pairs(positions) do
            posString=posString..x..","..y..","..z.."|"
        end
        return posString
    end,

    ["sendToTurtles"]=function(replyChannel,message)
        local turtleChannel=utils.split(message,"|",2)
        local message=utils.split(message,"|",3)
        local turtle=turtles[replyChannel]
        turtle.task=message
        turtle.status="working"

    end,

    ["indexItems"]=function(replyChannel,message)
        indexItems()
        return "confirmed"
    end,

    ["assign"]=function(replyChannel)
        if turtles[replyChannel]==nil then
            turtles[replyChannel]={
                channel=replyChannel,
                status="idle",
                lastMessage = os.clock()
            }
            event.trigger("onTurtleAssign",replyChannel,turtles[replyChannel],"confirmed")
            event.trigger("onTurtleStatusChange",replyChannel,turtles[replyChannel],false,"idle")
            return "confirmed"
        else
            event.trigger("onTurtleAssign",replyChannel,turtles[replyChannel],"denied")
            return "denied"
        end
    end,

    ["status"]=function(replyChannel,message)
        if turtles[replyChannel]==nil then
            return "denied"
        end
        local previous=turtles[replyChannel].status
        local status=utils.split(message,"|",2)
        turtles[replyChannel].status=status
        event.trigger("onTurtleStatusChange",replyChannel,turtles[replyChannel],previous,status)
    end,

    ["requestDropoff"]=function(replyChannel,message)
        return "returnDropoff|"..drop.x..","..drop.y..","..drop.z
    end,

    ["requestRestPos"]=function(replyChannel,message)
        return "returnHomePos|"..rest.x..","..rest.y..","..rest.z
    end,
}


function handleMessages(side,channel,replyChannel,message)
    --print(replyChannel.." : "..message)
    if turtles[replyChannel] ~= nil then
        turtles[replyChannel].lastMessage = os.clock()
    end
    local messageType=utils.split(message,"|",1)
    if messageHandles[messageType]==nil then return end
    local returnMessage=messageHandles[messageType](replyChannel,message)
    event.handleCCEvents(0.10)
    if returnMessage==nil then return end
    --print(replyChannel .. " : " .. returnMessage)
    modems[side].transmit(replyChannel,localChannel,returnMessage)
end
event.addHandler("modem_message",handleMessages)

while true do
    event.handleCCEvents()
end

print("ENDED GRACEFULLY")
