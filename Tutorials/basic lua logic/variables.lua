--variable x = string "hello world"
x = "hello world"

-- prints variable x that we just defined
print(x)

-- x is a global variable recognized in all programs
-- to prevent this, make a local variable instead
local x = "hello world"

--all undefined variables = NIL.
print(h)

--variables can be named whatever you want
local nanodesu = "hentai"

--you can use numerically defined variables in apis that require numbers. The same goes for strings.
term.clear()
local x = 1
local y = 3
textPrint = "hello world"
term.setCursorPos(x,y)

print(textPrint)
--

--double periods .. can be used to concatenate strings.
textPrint = "hello world"
print(textPrint.." how you doin'")
--

--The computer runs code from top to bottom. If you use a variable then define it afterwards, that variable will return nil when it is called.
-- always define variables first!
term.clear()
term.setCursorPos(x,y) -- x and y are nil here because they are defined on the next line.
local x = 1
local y = 3
--

--lua random function is math.random
--math.random(min,max) defines a range for what number will be pulled.
local x = math.random(1, 10)
--
