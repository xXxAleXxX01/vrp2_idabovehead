local names = class("Names", vRP.Extension)

factions = {
	{"!group.muie200", "ownercupata"}
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

--[[AddEventHandler('chatMessage', function(source, color, msg)
	cm = stringsplit(msg, " ")
	local user = vRP.users_by_source[source]
	if user:hasPermission("sadmin.textchat") then
if cm[1] == "/noid" then
	CancelEvent()
		TriggerClientEvent("SetGod", -1, source)
		TriggerClientEvent('chatMessage', -1, "^0[^4ZenTrix^0]", {255, 0, 0}, "^0Un admin a ^1dezactivat ^0id-urile.")
end    
if cm[1] == "/id" then
	CancelEvent()
		TriggerClientEvent("SetGod1", -1, source)
		TriggerClientEvent('chatMessage', -1, "^0[^4ZenTrix^0]", {255, 0, 0}, "^0Un admin a ^2activat ^0id-urile.")
	end
end    
end)]]

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