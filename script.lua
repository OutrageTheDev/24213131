print('Anime Adventures')
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")
local LuaName = "Anime Adventures"

--* Configuration *--
local initialized = false
local sessionid = ""


StarterGui:SetCore("SendNotification", {
    Title = LuaName,
    Text = " Intializing...",
    Duration = 5
})


--* Application Details *--
Name = "crash roblox" --* Application Name
Ownerid = "TdniilgWZT" --* OwnerID
APPVersion = "1.0"     --* Application Version

local req = game:HttpGet('https://keyauth.win/api/1.1/?name=' .. Name .. '&ownerid=' .. Ownerid .. '&type=init&ver=' .. APPVersion)

if req == "KeyAuth_Invalid" then 
   print(" Error: Application not found.")

   StarterGui:SetCore("SendNotification", {
	   Title = LuaName,
	   Text = " Error: Application not found.",
	   Duration = 3
   })

   return false
end

local data = HttpService:JSONDecode(req)

if data.success == true then
   initialized = true
   sessionid = data.sessionid
   --print(req)
elseif (data.message == "invalidver") then
   print(" Error: Wrong application version..")

   StarterGui:SetCore("SendNotification", {
	   Title = LuaName,
	   Text = " Error: Wrong application version..",
	   Duration = 3
   })

   return false
else
   print(" Error: " .. data.message)
   return false
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/PDCloud/Pivl-CDN/main/keyauth/robloxUI.lua"))()
local Window = Library.CreateLib("KeyAuth Lua Example [ROBLOX] - github.com/mazk5145")

-- Tabs --
local Tab = Window:NewTab("Welcome")
local WelcomeSection = Tab:NewSection("Welcome")

local LoginTab = Window:NewTab("Login")
local MainSection = LoginTab:NewSection("Login")

-- Configuration !! KEEP CLEAR !!--
local Username = ""
local Password = ""

WelcomeSection.NewLabel("Application Details", "Number of users: " .. data.appinfo.numUsers .. "\nNumber of online users: " .. data.appinfo.numOnlineUsers .. "\n Number of keys: " .. data.appinfo.numKeys .. "\n Application Version: " .. data.appinfo.version)

-- Text Boxes and Login Button --
MainSection:NewTextBox("Username", "Please provide Username.", function(state)
    if state then
        Username = state
    end
end)

MainSection:NewTextBox("Password", "Please provide Password.", function(state)
    if state then
        Password = state
    end
end)

MainSection:NewButton("Login to Application ?", "Please provide Password.", function(state)
    if Username == "" then
        StarterGui:SetCore("SendNotification", {
            Title = LuaName,
            Text = " Error: Username is empty.",
            Duration = 3
        })
        return false
    end
    if Password == "" then
        StarterGui:SetCore("SendNotification", {
            Title = LuaName,
            Text = " Error: Password is empty.",
            Duration = 3
        })
        return false
    end

    Library.Destroy()

    local req = game:HttpGet('https://keyauth.win/api/1.1/?name=' .. Name .. '&ownerid=' .. Ownerid .. '&type=login&username=' .. Username .. '&pass=' .. Password ..'&ver=' .. APPVersion .. '&sessionid=' .. sessionid)
    local data = HttpService:JSONDecode(req)
    
    
    if data.success == false then 
        print(" Error: " .. data.message )
    
       StarterGui:SetCore("SendNotification", {
           Title = LuaName,
           Text = " Error: " .. data.message,
           Duration = 5
       })
    
        return false
    end
    
    StarterGui:SetCore("SendNotification", {
        Title = LuaName,
        Text = " Successfully Authorized :)",
        Duration = 5
    })

    -- Your Code --
while true do
    print('puhqi sucks no dick')
end

end)