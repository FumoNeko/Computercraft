shell.setPath( ".:/rom/programs" )
help.setPath( "/rom/help" )

shell.setAlias( "ls", "list" )
shell.setAlias( "dir", "list" )
shell.setAlias( "cp", "copy" )
shell.setAlias( "mv", "move" )
shell.setAlias( "rm", "delete" )

if fs.isDir('/mem/autorun') then
	local files = fs.list('/mem/autorun')
	table.sort(files)
	for k, file in ipairs(files) do
		local path = fs.combine('/mem/autorun', file)
		if not fs.isDir(path) then
			shell.run(path)
		end
	end
end
local nativeTerm = term.native or term

local function invoke(sMethod, ...)
nativeTerm[sMethod](...)
for k,sSide in pairs(redstone.getSides()) do
  if peripheral.isPresent(sSide) and peripheral.getType(sSide) == "monitor" then
   peripheral.call(sSide, sMethod, ...)
  end
end
end

term.write = function(text) invoke("write", text) end
term.scroll = function(n) invoke("scroll", n) end
term.setCursorPos = function(x, y) invoke("setCursorPos", x, y) end
term.setCursorBlink = function(B) invoke("setCursorBlink", B) end
term.clear = function() invoke("clear") end
term.clearLine = function() invoke("clearLine") end

nativeTerm.clear()
nativeTerm.setCursorPos(1, 1)
print(os.version() .. " - Modded with TCMail 1 - Client")
print("This is computer number " .. os.getComputerID())
shell.run("mailregsilent")
print("Type mhelp for the TCMail help program.")