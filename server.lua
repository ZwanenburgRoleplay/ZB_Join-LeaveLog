

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent("esx:randylog")
AddEventHandler("esx:randylog", function()
local xPlayer = ESX.GetPlayerFromId(source)
local steam = GetPlayerName(source)
local nome = xPlayer.getName()
--local gruppo = xPlayer.getGroup()
local lavoro = xPlayer.job.name
local grado = xPlayer.job.grade
--local permessi = xPlayer.getPermissions()
local soldi = xPlayer.getMoney()
local soldi2 = xPlayer.getAccount('bank').money
local soldi3 = xPlayer.getAccount('black_money').money
--local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local ids = ExtractIdentifiers(source)
if Config.xblID then xblID ="\n**Xbox ID:  ** " ..ids.xbl.."" else xblID = "" end
if Config.steamID then _steamID ="\n**Steam ID:  ** " ..ids.steam.."" else _steamID = "" end
if Config.liveID then _liveID ="\n**Live ID:  ** " ..ids.live.."" else _liveID = "" end
if Config.playerID then _playerID ="\n**Player ID:  ** " ..source.."" else _playerID = "" end
if Config.discordID then _discordID ="\n**Discord ID:  ** <@" ..ids.discord:gsub("discord:", "")..">" else _discordID = "" end
if Config.licenseID then _licenseID ="\n**License ID:  ** " ..ids.license.."" else _licenseID = "" end
if Config.steamURL then _steamURL ="\n\n **Steam Url  **https://steamcommunity.com/profiles/" ..tonumber(ids.steam:gsub("steam:", ""),16).."" else _steamURL = "" end
renterdiscord('**Connected to the server:\n**Ingame Naam:** ' ..nome.. '\n\n**Steam Naam:** ' ..steam.. '\n' .._playerID.. '\n ' .._steamID.. ' ' .._steamURL.. '\n' .._discordID.. '\n\n**Ping:** ' ..ping.. '\n\n**Money: **' ..soldi..'\n\n**Money Bank: **' ..soldi2..'\n\n**Black Money: **' ..soldi3..'\n\n**Job: **' ..lavoro..'\n\n**Job Grade: **' ..grado..'**')
end) 




function renterdiscord(message)
	local content = {
        {
        	["color"] = '3863105',  --verde
            ["title"] = "Algemene Log",
            ["description"] = message,
            ["footer"] = {
                ["text"] = "Dario's Log - "..os.date("%x %X %p")
            }, 
        }
    }
        
  	PerformHttpRequest( "https://discord.com/api/webhooks/803389993061449778/V_ZlFzoHvsP7NHQeEoJvbeKBYdjViif2eLyi2ekezI3pxsv9Fja9iruOiypAsDNUtIHO" , function(err, text, headers) end, 'POST', json.encode({username = name, embeds = content}), { ['Content-Type'] = 'application/json' })
end



AddEventHandler("playerDropped", function(reason)
    local xPlayer = ESX.GetPlayerFromId(source)
    local steam = GetPlayerName(source)
    local nome = xPlayer.getName()
    --local gruppo = xPlayer.getGroup()
    local lavoro = xPlayer.job.name
    local grado = xPlayer.job.grade
    --local permessi = xPlayer.getPermissions()
    local soldi = xPlayer.getMoney()
    local soldi2 = xPlayer.getAccount('bank').money
    local soldi3 = xPlayer.getAccount('black_money').money
    --local ip = GetPlayerEndpoint(source)
    local ping = GetPlayerPing(source)
    local ids = ExtractIdentifiers(source)
    if Config.xblID then xblID ="\nXbox ID:   " ..ids.xbl.."" else xblID = "" end
    if Config.steamID then _steamID ="\nSteam ID:   " ..ids.steam.."" else _steamID = "" end
    if Config.liveID then _liveID ="\nLive ID:   " ..ids.live.."" else _liveID = "" end
    if Config.playerID then _playerID ="\nPlayer ID:   " ..source.."" else _playerID = "" end
    if Config.discordID then _discordID ="\nDiscord ID:   <@" ..ids.discord:gsub("discord:", "")..">" else _discordID = "" end
    if Config.licenseID then _licenseID ="\nLicense ID:   " ..ids.license.."" else _licenseID = "" end
    if Config.steamURL then _steamURL ="\n\n Steam Url  https://steamcommunity.com/profiles/" ..tonumber(ids.steam:gsub("steam:", ""),16).."" else _steamURL = "" end
    rexitdiscord('It has disconnected from the server: \n\nUitlog reden: ' .. reason .. '\n\nIngame Naam: ' ..nome.. '\n\nSteam Naam: ' ..steam.. '\n' .._playerID.. '\n ' .._steamID.. ' ' .._steamURL.. '\n' .._discordID.. '\n\nPing:   ' ..ping.. '\n\nMoney:  ' ..soldi..'\n\nMoney Bank: ' ..soldi2..'\n\nBlack Money: ' ..soldi3..'\n\nJob: ' ..lavoro..'\n\nJob Grade: ' ..grado..'')
    end) 

function rexitdiscord(message)
	local content = {
        {
        	["color"] = '15874618', --rosso
            ["title"] = "Algemene Log",
            ["description"] = message,
            ["footer"] = {
                ["text"] = "Dario's Log - "..os.date("%x %X %p")
                
            }, 
        }
    }
        
  	PerformHttpRequest( "https://discord.com/api/webhooks/825963444926152754/z-mLJfH6wUympP94oKWZnQQ48mMyuo5ZFyBGfU9_xFc-lhPR-EIV2FDuJRZeCd1TUUXy" , function(err, text, headers) end, 'POST', json.encode({username = name, embeds = content}), { ['Content-Type'] = 'application/json' })
end
RegisterServerEvent('ClientDiscord')
AddEventHandler('ClientDiscord', function(message, color, channel)
   discordLog(message, color,  channel)
end)


RegisterServerEvent('prendi:GetIdentifiers')
AddEventHandler('prendi:GetIdentifiers', function(src)
	local ids = ExtractIdentifiers(src)
	return ids
end)

function ExtractIdentifiers(src)
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
        xbl = "",
        live = ""
    }

    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)

        if string.find(id, "steam") then
            identifiers.steam = id
        elseif string.find(id, "ip") then
            identifiers.ip = id
        elseif string.find(id, "discord") then
            identifiers.discord = id
        elseif string.find(id, "license") then
            identifiers.license = id
        elseif string.find(id, "xbl") then
            identifiers.xbl = id
        elseif string.find(id, "live") then
            identifiers.live = id
        end
    end

    return identifiers
end
