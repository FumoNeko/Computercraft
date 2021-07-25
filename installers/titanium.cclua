--[[   Titanium Developer Tools   ]]--
--[[       TPM/TDT/package        ]]--
--[[                              ]]--
--[[    Harry Felton (hbomb79)    ]]--

--[[ Init ]]--
if not http then
    error "This program requires the HTTP API be loaded. Please load the HTTP API to continue (this maybe a problem with your CC configuration)"
end

local isColour = term.isColour()
local function out( text, colour, same )
    term.setTextColour( isColour and colour or 1 )

    if same then write( text ) else print( text ) end
end

if fs.exists "/.tpm" then
    out("Previous Installation Detected!\n\nFiles inside of /.tpm may be overwritten during installation.\n\nThis could remove TPM installations and/or previous TDT projects. Do you wish to continue? ", colours.red, true)
    out("(Y/n)", colours.blue)
    while true do
        local k = select( 2, os.pullEvent "key" )
        os.pullEvent()
        if k == keys.y then break elseif k == keys.n then out("Aborting", colours.orange) return end
    end
end

local fetched = {}
local function fetch( url, name )
    local handle = http.get( url )
    if handle then
        out( "Success", colours.green )
        table.insert( fetched, { handle, url:match "/(%w+)[^/]*/?$" } )
    else
        error( "Failed to fetch '"..url.."', http GET failed. Ensure you have internet connection, otherwise try again later" )
    end
end

local function save()
    for i = 1, #fetched do
        local handle = fetched[ i ][ 1 ]
        local f = fs.open( ("/.tpm/bin/%s"):format( fetched[ i ][ 2 ] ), "w" )
        f.write( handle.readAll() )
        f.close()

        handle.close()
    end
end

--[[ Download ]]--
out( "\nStarting install", colours.purple )
out( "Fetching Titanium Package Manager (TPM)... ", colours.blue, true )
fetch "https://gitlab.com/hbomb79/Titanium-Package-Manager/raw/master/tpm"

out( "Fetching Titanium Developer Tools (TDT)... ", colours.blue, true )
fetch "https://gitlab.com/hbomb79/Titanium-Package-Manager/raw/master/tdt"

out( "Fetching Titanium Packager... ", colours.blue, true )
fetch "https://gitlab.com/hbomb79/Titanium/raw/develop/bin/package.lua"

--[[ Installation ]]--
fs.makeDir "/.tpm"
fs.makeDir "/.tpm/packages"
fs.makeDir "/.tpm/bin"

fs.open("/.tpm/tpm.cfg", "w").close()

save()

--[[ Configuration ]]--

shell.setPath( shell.path() .. ":/.tpm/bin" )

out( "\nWould you like to patch your startup file so that '/.tpm/bin' is added to your PATH. This will allow you to use the developer commands without using the full paths? ", colours.orange, true )
out("(Y/n)", colours.blue)
while true do
    local _, k = os.pullEvent "key"
    os.pullEvent()
    if k == keys.y then
        local ok, err = loadfile( "/.tpm/bin/tpm" )
        if ok then
            ok "patch"
            break
        else
            error("Failed to load TPM. Error: " .. tostring( err ))
        end
    elseif k == keys.n then break end
end

out("\nPatch your startup file at anytime using 'tpm patch'", colours.lightBlue)
out( "Installation complete", colours.green )
