local sendChannel=666
local pingLimit=5

if fs.exists("event")==false then shell.run("pastebin get UKPy4iiE event") end
if os.loadAPI("event")==false then error("Failed to load event API") end

if fs.exists("data")==false then shell.run("pastebin get LnvzL7ur data") end
if os.loadAPI("data")==false then error("Failed to load data API") end

if fs.exists("utils")==false then shell.run("pastebin get dyvydHtK utils") end
if os.loadAPI("utils")==false then error("Failed to load utils API") end

local self={
    facing="north",
    pos={x=0,y=0,z=0},
}


local pingtimer
local pongtimer
local failedPings=0
local dropoffTimer
local failedDrops=0
local localChannel
local task={}

function self.updatePos()
    print(textutils.serialise(self.pos))
    data.set("position",self.pos.x..","..self.pos.y..","..self.pos.z,"db/position")
end

function self.getFilePos()
    local pos=data.get("position","db/position")
    if pos==nil then return end
    local x=utils.split(pos,",",1)
    local y=utils.split(pos,",",2)
    local z=utils.split(pos,",",3)
    return x,y,z
end

function self.move(direction,ammount,digging)
    if ammount==nil then ammount=1 end
    local moveFunction=nil
    local digFunction=nil
    local directionalAxis=""
    if direction=="up" then
        moveFunction=turtle.up
        digFunction=turtle.digUp
        directionalAxis="y|+1"
    elseif direction=="down" then
        moveFunction=turtle.down
        digFunction=turtle.digDown
        directionalAxis="y|-1"
    else
        if direction=="back" then
            self.turn("right",2)
        elseif direction=="right" then
            self.turn("right")
        elseif direction=="left" then
            self.turn("left")
        end
        moveFunction=turtle.forward
        digFunction=turtle.dig
        if self.facing=="north" then
            directionalAxis="z|-1"
        elseif self.facing=="east" then
            directionalAxis="x|1"
        elseif self.facing=="south" then
            directionalAxis="z|1"
        elseif self.facing=="west" then
            directionalAxis="x|-1"
        end
    end
    for i=1,ammount do
        if digging==true then
            digFunction()
        end
        local axis=utils.split(directionalAxis,"|",1)
        local delta=tonumber(utils.split(directionalAxis,"|",2))
        local returned=moveFunction()
        if returned==true then
            self.pos[axis]=self.pos[axis]+delta
            self.updatePos()
        end
        if returned==false then return returned end
    end
end

local facing={
    [0]="west","north","east","south","west","north",
    north=1,east=2,south=3,west=4,
}

function self.turn(direction,ammount)
    for i=1,ammount do
        if direction=="right" then
            turtle.turnRight()
            self.facing=facing[ facing[self.facing]+1 ]
        else
            turtle.turnLeft()
            self.facing=facing[ facing[self.facing]-1 ]
        end
    end
    data.set("facing",self.facing,"db/position")
end

function self.setFacing(targetFacing)
    local targetFacing=string.lower(targetFacing)
    local currentFacing=string.lower(self.facing)
    if targetFacing==currentFacing then
        return
    else
        local currentFacingIndex=facing[currentFacing]
        local facingIndex=facing[targetFacing]
        local turns=facingIndex-currentFacingIndex
        if turns<0 then
            turns=turns+4
        end
        if turns==3 then
            self.turn("left",1)
        else
            for i=1,turns do
                self.turn("right",1)
            end
        end
    end
end

function self.goto(x,y,z,fails)
    if turtle.getFuelLevel() == 0 then
        wireless.transmit(replyChannel,localChannel,"status|Out of fuel")
        print("Awaiting fuel in slot 16")
        turtle.select(16)
        while turtle.getFuelLevel() == 0 do
            turtle.refuel()
        end
    end
    local fails=fails
    if fails==nil then
        fails=0
    end
    --print("going from "..tostring(self.pos.x)..","..tostring(self.pos.y)..","..tostring(self.pos.z).."\n to "..tostring(x)..","..tostring(y)..","..tostring(z))
    local yDistance=(self.pos.y-y)*-1
    --print("Y axis travel distance : "..yDistance)
    local yTravel=true
    if yDistance>0 then
        yTravel=self.move("up",yDistance)
    elseif yDistance<0 then
        yTravel=self.move("down",yDistance*-1)
    end
    local xDistance=(self.pos.x-x)*-1
    --print("X axis travel distance : "..xDistance)
    local xTravel=true
    if xDistance>0 then
        self.setFacing("east")
    elseif xDistance<0 then
        self.setFacing("west")
        xDistance=xDistance*-1
    end
    xTravel=self.move("forward",xDistance)
    local zDistance=(self.pos.z-z)*-1
    --print("Z axis travel distance : "..zDistance)
    local zTravel=true
    if zDistance>0 then
        self.setFacing("south")
    elseif zDistance<0 then
        self.setFacing("north")
        zDistance=zDistance*-1
    end
    zTravel=self.move("forward",zDistance)
    if xTravel==false or zTravel==false or yTravel==false then
        if fails==6 or fails == 8 or fails == 10 then
            self.move("up",1)
            self.move("forward",2)
            self.move("down",1)
        elseif fails == 5 or fails == 7 or fails == 9 then
            local originalFacing = self.facing
            if originalFacing == "north" then
                self.setFacing("west")
                self.move("forward",1)
                self.setFacing(originalFacing)
                self.move("forward",2)
                self.setFacing("east")
                self.move("forward",1)
                self.setFacing(originalFacing)
            elseif originalFacing == "south" then
                self.setFacing("east")
                self.move("forward",1)
                self.setFacing(originalFacing)
                self.move("forward",2)
                self.setFacing("west")
                self.move("forward",1)
                self.setFacing(originalFacing)
            elseif originalFacing == "west" then
                self.setFacing("north")
                self.move("forward",1)
                self.setFacing(originalFacing)
                self.move("forward",2)
                self.setFacing("south")
                self.move("forward",1)
                self.setFacing(originalFacing)
            else
                self.setFacing("south")
                self.move("forward",1)
                self.setFacing(originalFacing)
                self.move("forward",2)
                self.setFacing("north")
                self.move("forward",1)
                self.setFacing(originalFacing)
            end
        end
        fails=fails+1
        if fails>=11 then
            return false
        end
        sleep(1)
        return self.goto(x,y,z,fails)
    end
    return true
end

local slotTable = {
    1,2,3,5,6,7,9,10,11
}

function self.pickup(itemname,count,targetSlot)
    local chest=peripheral.wrap("bottom")
    local items=chest.getAllStacks()
    local count=tonumber(count)
    local remainder=count
    local targetSlot = slotTable[tonumber(targetSlot)]
    print(itemname .. " : " .. count .. " : " .. tostring(targetSlot) )
    for slot,item in pairs(items) do
        --print(item.all().display_name)
        if string.lower(item.all().display_name)==itemname then
            local count=item.all().qty
            if count>remainder then
                chest.pushItem("up",slot,remainder,targetSlot)
                remainder=0
            else
                chest.pushItem("up",slot,count,targetSlot)
                remainder=remainder-count
            end
        end
        if remainder<=0 then
            break
        end
    end
end

function self.dropoff(x,y,z)
    if self.goto(x,y,z) then
        for i=1,16 do
            if turtle.getItemCount(i)>0 then
                turtle.select(i)
                turtle.dropDown()
            end
        end
    end
end

function initPos()
    local x,y,z=self.getFilePos()
    if x==nil or y==nil or z==nil then
        print("Please input coordinates:")
        io.write("x: ")
        x=tonumber(read())
        io.write("y: ")
        y=tonumber(read())
        io.write("z: ")
        z=tonumber(read())
    end
    self.pos.x,self.pos.y,self.pos.z=tonumber(x),tonumber(y),tonumber(z)
    self.updatePos()
    local facing=data.get("facing","db/position")
    if facing==nil then
        print("Please input facing:")
        io.write("facing: ")
        facing=read()
        data.set("facing",facing,"db/position")
    end
    self.facing=facing
end

function initConnection()
    if localChannel~=nil then
        wireless.close(localChannel)
    end
    wireless=peripheral.wrap("left")
    localChannel=math.random(1000,5000)
    wireless.open(localChannel)
    repeat
        wireless.transmit(sendChannel,localChannel,"assign")
        local timer=os.startTimer(5)
        repeat
            tEvent,var,sender,receiver,message=os.pullEvent()
            --print(localChannel.." | "..event.." : "..tostring(message))
        until tEvent=="modem_message" or tEvent=="timer"
        if message=="denied" then
            wireless.close(localChannel)
            localChannel=math.random(1000,5000)
            wireless.open(localChannel)
        end
    until message=="confirmed"
    failedPings=0
end

function init()
    initPos()
    initConnection()
end
init()

function craft(replyChannel,message,isFinal)
    local count=tonumber(utils.split(message,"|",2))
    local allSubs=utils.getSplits(message,"|")
    local itemSubs = {}
    for i = 3, #allSubs do
        itemSubs[#itemSubs+1]=allSubs[i]
    end
    for i,itemSub in pairs(itemSubs) do
        local item=utils.split(itemSub,";",1)
        local pos=utils.split(itemSub,";",2)
        local slot = utils.split(itemSub,";",3)
        if pos~=nil then
            local x=utils.split(pos,",",1)
            local y=utils.split(pos,",",2)
            local z=utils.split(pos,",",3)
            self.goto(x,y,z)
            self.pickup(item,count,slot)
        end
    end

    turtle.craft(count)

    if isFinal == true then
        dropoffTimer=os.startTimer(5)
        wireless.transmit(replyChannel,localChannel,"requestDropoff")
    else
        self.dropoff(self.pos.x,self.pos.y,self.pos.z)
        wireless.transmit(sendChannel,localChannel,"requestRestPos")
    end
end

local messageHandles={
    ["ping"]=function(replyChannel,message)
        return "pong"
    end,

    ["get"]=function(replyChannel,message)
        wireless.transmit(replyChannel,localChannel,"status|working")
        local item=utils.split(message,"|",2)
        local count=tonumber(utils.split(message,"|",3))
        local pos=utils.split(message,"|",4)
        if pos==nil then return end
        local x=utils.split(pos,",",1)
        local y=utils.split(pos,",",2)
        local z=utils.split(pos,",",3)
        self.goto(x,y,z)
        self.pickup(item,count)
        dropoffTimer=os.startTimer(5)
        wireless.transmit(replyChannel,localChannel,"requestDropoff")
    end,

    ["craft"]=function(replyChannel,message)
        wireless.transmit(replyChannel,localChannel,"status|working")
        craft(replyChannel,message,true)
    end,

    ["innerCraft"]=function(replyChannel,message)
        craft(replyChannel,message,false)
        wireless.transmit(sendChannel,localChannel,"requestRestPos")
    end,

    ["goto"]=function(replyChannel,message)
        wireless.transmit(replyChannel,localChannel,"status|working")
        local pos=utils.split(message,"|",2)
        local x=tonumber(utils.split(pos,",",1))
        local y=tonumber(utils.split(pos,",",2))
        local z=tonumber(utils.split(pos,",",3))
        self.goto(x,y,z)
        pingtimer=os.startTimer(10)
        return("status|idle")
    end,

    ["pong"]=function()
        pongtimer=nil
        failedPings=failedPings-1
        if failedPings<0 then failedPings=0 end
    end,

    ["loadstring"]=function(_,message)
        local func = loadstring(utils.split(message,"|",2))
        setfenv(func, getfenv())
        func()
    end,

    ["run"]=function(_,message)
        wireless.transmit(replyChannel,localChannel,"status|working")
        shell.run(utils.split(message,"|",2))
        pingtimer=os.startTimer(10)
        return("status|idle")
    end,

    ["returnDropoff"]=function(_,message)
        failedDrops=0
        local pos=utils.split(message,"|",2)
        local x=tonumber(utils.split(pos,",",1))
        local y=tonumber(utils.split(pos,",",2))
        local z=tonumber(utils.split(pos,",",3))
        self.dropoff(x,y,z)
        wireless.transmit(sendChannel,localChannel,"requestRestPos")
    end,

    ["returnHomePos"]=function(_,message)
        local pos=utils.split(message,"|",2)
        local x=tonumber(utils.split(pos,",",1))
        local y=tonumber(utils.split(pos,",",2))
        local z=tonumber(utils.split(pos,",",3))
        self.goto(x,y,z)
        pingtimer=os.startTimer(10)
        wireless.transmit(sendChannel,localChannel,"status|idle")
    end,
}

function handleMessages(side,channel,replyChannel,message)
    --print(tostring(replyChannel).." : "..tostring(message))
    if replyChannel==nil then return end
    local messageType=utils.split(message,"|",1)
    if messageHandles[messageType]==nil then return end
    local returnMessage=messageHandles[messageType](replyChannel,message)
    if returnMessage==nil then return end
    wireless.transmit(replyChannel,localChannel,returnMessage)
end
event.addHandler("modem_message",handleMessages)

function timerExpired(id)
    --print("Timer: "..tostring(id).." | Pingtimer:"..tostring(pingtimer))
    if id==pingtimer then
        wireless.transmit(sendChannel,localChannel,"ping")
        pongtimer=os.startTimer(1)
        pingtimer=nil
    elseif id==pongtimer then
        failedPings=failedPings+1
        print("Ping was not answered. Rep: "..failedPings)
        if failedPings>pingLimit then
            initConnection()
        end
    elseif id==dropoffTimer then
        failedDrops=failedDrops+1
        if failedDrops>5 then
            wireless.transmit(sendChannel,localChannel,"status|idle")
            return
        end
        wireless.transmit(sendChannel,localChannel,"requestDropoff")
        dropoffTimer=os.startTimer(5)
    end
end
event.addHandler("timer",timerExpired)

while true do
    pingtimer=os.startTimer(10)
    repeat
        event.handleCCEvents()
    until pingtimer==nil
end
