print("What's your name?")
write("Enter your name: ")
local name = read()
  if name == string.match(name, "bob.*$") then
    print("bob is cool")
  end
-- to use wildcards, use the string.match API
--string.match(variable, "string.*$") where .*$ is the wildcard.
