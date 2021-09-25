password = "asdf"
masterPass = "hi"

--write does not skip a line compared to print
write("Enter password: ")

input = read() -- the read() api prompts user input

-- standard if statement. if this do this. Otherwise do nothing.
if input == password then
  print("correct password entered")
end
--

--if else
if input == password then
  print("correct password entered")
else
  print("wrong password")
end
--

--For mutliple if conditions, use elseif
if input == password then
  print("correct password entered")
elseif input == masterPass then
  print("hello boss")
else
  print("wrong password")
end

-- you CAN nest if statements once you start going into different blocks.
if input == password then
  print("correct password entered")
elseif input == masterPass then
  write("g'day boss, how's the weather?")
  weather = read()
  if weather == "good" then
    print("good news")
  else
    print("Shitty weather huh?")
  end
else
  print ("wrong password")
end
