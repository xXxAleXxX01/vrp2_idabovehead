--------------------------CREDITS--------------------------
-------------------Script made by AleXxX-------------------
--      Script made for ZenTrix Romania RolePlay         --
--         Discord: https://discord.gg/BEFrqay           --
--   Copyright 2020 ©AleXxXScript's. All rights served   --
-----------------------------------------------------------

Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")

local cvRP = module("vrp", "client/vRP")
vRP = cvRP() 

local names = class("Names", vRP.Extension)

function names:__construct()
    vRP.Extension.__construct(self)
end

local players = {}
local permissions = {}
local groups = {}
local idd = {}
local incepator = {}

RegisterNetEvent('insertUser')
AddEventHandler('insertUser', function(user_id,source,permission,group,incep)
    players[user_id] = GetPlayerFromServerId(source)
    permissions[user_id] = permission
    groups[user_id] = group
    idd[source] = user_id
end)

RegisterNetEvent('removeUser')
AddEventHandler('removeUser', function(user_id)
    players[user_id] = nil
    idd[source] = nil
end)

local function curcubeu( frequency )
	local result = {}
	local curtime = GetGameTimer() / 4000

	result.r = math.floor( math.sin( curtime * frequency + 0 ) * 127 + 128 )
	result.g = math.floor( math.sin( curtime * frequency + 2 ) * 127 + 128 )
	result.b = math.floor( math.sin( curtime * frequency + 4 ) * 127 + 128 )
	
	return result
end

names.tunnel = {}

aa = false

local disPlayerNames = 10
local playerDistances = {}

local function DrawText3D(x,y,z, text, r,g,b) 
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = #(vector3(px,py,pz)-vector3(x,y,z))
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        if not useCustomScale then
            SetTextScale(0.0*scale, 0.55*scale)
        else 
            SetTextScale(0.0*scale, customScale)
        end
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(r, g, b, 255)
        SetTextDropshadow(0, 0, 0, 0, 100)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

Citizen.CreateThread(function()
	Wait(500)
	while true do
		if IsControlPressed(1, 217) then
        for _, id in ipairs(GetActivePlayers()) do
				if GetPlayerPed(id) ~= GetPlayerPed(-1) then
				
					if playerDistances[id] then
						if (playerDistances[id] < disPlayerNames) then
                            x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))
                            	if NetworkIsPlayerTalking(id) then
                                	DrawText3D(x2, y2, z2+1, idd[GetPlayerServerId(id)], 255,255,255)
								--DrawMarker(27, x2, y2, z2-0.97, 0, 0, 0, 0, 0, 0, 1.001, 1.0001, 0.5001, 173, 216, 230, 100, 0, 0, 0, 0)
							else
								DrawText3D(x2, y2, z2+1, idd[GetPlayerServerId(id)], 255,255,255)
							end
						elseif (playerDistances[id] < 10) then
							x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))						
							--if NetworkIsPlayerTalking(id) then
                                				--DrawMarker(27, x2, y2, z2-0.97, 0, 0, 0, 0, 0, 0, 1.001, 1.0001, 0.5001, 173, 216, 230, 100, 0, 0, 0, 0)
							--end
						end
					end
				end
		end
		end
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        for _, id in ipairs(GetActivePlayers()) do
            --if GetPlayerPed(id) ~= GetPlayerPed(-1) then
                x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))
                distance = math.floor(#(vector3(x1,  y1,  z1)-vector3(x2,  y2,  z2)))
				playerDistances[id] = distance
            --end
        end
        Citizen.Wait(1000)
    end
end)
