--------------------------CREDITS--------------------------
-------------------Script made by AleXxX-------------------
--      Script made for ZenTrix Romania RolePlay         --
--         Discord: https://discord.gg/BEFrqay           --
--   Copyright 2020 ©AleXxXScript's. All rights served   --
-----------------------------------------------------------

local Proxy = module("vrp", "lib/Proxy")

local vRP = Proxy.getInterface("vRP")

async(function()
  vRP.loadScript("vrp_names", "sv_main")
end)
