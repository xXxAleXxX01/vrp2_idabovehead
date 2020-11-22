--------------------------CREDITS--------------------------
-------------------Script made by AleXxX-------------------
--      Script made for ZenTrix Romania RolePlay         --
--         Discord: https://discord.gg/BEFrqay           --
--   Copyright 2020 ©AleXxXScript's. All rights served   --
-----------------------------------------------------------

local names = class("Names", vRP.Extension)

factions = {
	{"!group.aaa", "owner"}
}

function names:__construct()
    vRP.Extension.__construct(self)
end


local function update_name(player, user, source)
	group = "Civilian"

	--[[for i, v in pairs(factions) do
		theGroup = tostring(v[1])
		theName = tostring(v[2])
		if(user:hasPermission(theGroup))then
			group = theGroup
		end
	end]]
	TriggerClientEvent('insertUser',player,user.id,source,user:hasPermission("player.group.add"),group)
end

names.event={}


function names.event:playerSpawn(user, first_spawn) 
	for k,v in pairs(vRP.users) do 
		update_name(user.source,vRP.users[k],vRP.users[k].source)
		update_name(v.source,user,user.source)
	end
end

function names.event:playerLeave(user)
	for k,v in pairs(vRP.users) do
		TriggerClientEvent('removeUser',v,user.id)
	end
end

function stringsplit(inputstr, sep)
  if sep == nil then
      sep = "%s"
  end
  local t={} ; i=1
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
      t[i] = str
      i = i + 1
  end
  return t
end


vRP:registerExtension(names)
