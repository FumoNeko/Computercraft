--events are things that happen
--each event type can be found here https://computercraft.info/wiki/Os.pullEvent

--you can assign multiple variables at a time
--The program does nothing until an event happens.
--Pressing a key generates event: key param1 25
event, param1 = os.pullEvent()

print("Event: "..event.." Param1: "..param1)
--
--events can have multiple parameters depending on which event it is.
event, param1, param2 = os.pullEvent()

print("Event: "..event.." Param1: "..param1.." Param2: "..param2)

--event listener
while true do
  event, param1, param2 = os.pullEvent()

print("Event: "..event.." Param1: "..param1.." Param2: "..param2)
end
--

--chat listener
while true do
  event, param1, param2 = os.pullEvent("chat")

print(param1..": "..param2)
end
