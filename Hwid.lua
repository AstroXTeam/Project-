local bannedHWID = ""
local function checkAndKickPlayer()
    local player = game:GetService("Players").LocalPlayer
    local playerHWID = player.UserId
    if playerHWID == bannedHWID then
        player:Kick("You Have Been Banned From AstroXHub To Unban Come to Telegram \n لقد تم تبنيدك من سكربت استرو اكس لحل مشكله تعال التليكرام \n تم نسخ رابط • Copy telegram link")
    end
end    
checkAndKickPlayer()
local function sendErrorLogToDiscord(errorMessage)
    local httpService, stats, userInput = game:GetService("HttpService"), game:GetService("Stats"), game:GetService("UserInputService")
    local player, placeId = game.Players.LocalPlayer, game.PlaceId
    local localTime = os.date("!%Y-%m-%dT%H:%M:%SZ")
    local hwid = game:GetService("RbxAnalyticsService"):GetClientId()
    local embed = {
        title = 'Log Script Rimuru Hub',
        color = 0x9600FF,
        fields = {
            { name = '# Info Map', value = '', },
            { name = 'Name', value = game:GetService("MarketplaceService"):GetProductInfo(placeId).Name },
            { name = 'PlaceId', value = placeId },
            { name = 'Map Url', value = "https://www.roblox.com/games/" .. placeId .. "/MapName" },
            { name = '# Info Player', value = '', },
            { name = 'Player Profile', value = "https://www.roblox.com/users/" .. player.UserId .. "/profile" },
            { name = 'Name', value = player.Name },
            { name = 'UserId', value = player.UserId },
            { name = 'Device Type', value = userInput.TouchEnabled and "Mobile" or "PC" },
            { name = 'Input Method', value = userInput.KeyboardEnabled and "Keyboard" or "Touch" },
            { name = '# Info Server', value = '', },
            { name = 'Server ID', value = game.JobId },
            { name = 'Ping', value = stats.Network.ServerStatsItem["Data Ping"]:GetValueString() },
            { name = '# Info Performance', value = '', },
            { name = 'Memory Usage', value = math.floor(collectgarbage("count")) .. " KB" },
            { name = 'Session Duration', value = math.floor(workspace.DistributedGameTime) .. " seconds" },
            { name = 'FPS', value = string.format("%.2f", stats.FrameRateManager.RenderedFps) },
            { name = '#Hwid', value = hwid, },
            { name = 'Error Details', value = errorMessage or "No error reported." },
        },
        timestamp = localTime,
    }

    local success, response = pcall(function()
        return (syn and syn.request or http_request) {
            Url = 'https://discord.com/api/webhooks/1329954213811191913/gKQDWRFNoJjl2wIq6Ra8VazUAIx85EnKfTEXTwHa0e4gMuou3va-9hg0J53tFP_RnkrT',
            Method = 'POST',
            Headers = { ['Content-Type'] = 'application/json' },
            Body = httpService:JSONEncode({
                username = 'Rimuru Hub',
                avatar_url = 'https://cdn.discordapp.com/attachments/1273992951780999231/1305094174445666365/3_20241018191802.png',
                embeds = { embed }
            }),
        }
    end)

    if not success then print("Error sending log: " .. tostring(response)) end
end

sendErrorLogToDiscord("Script initialization failed!", "Additional debugging details can go here.")
