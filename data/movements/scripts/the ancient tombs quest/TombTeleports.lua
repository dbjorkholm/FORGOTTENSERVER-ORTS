local config = {
	[3953]  = {storage = Storage.TheAncientTombs.Omruc, destination = {x = 33145, y = 32665, z = 15}}, -- from Omruc Boss
	[3951]  = {storage = Storage.TheAncientTombs.Thalas, destination = {x = 33174, y = 32934, z = 15}}, -- from Thalas Boss
	[3955]  = {storage = Storage.TheAncientTombs.Diphtrah, destination = {x = 33349, y = 32827, z = 14}}, -- from  Dipthrah Boss
	[3952]  = {storage = Storage.TheAncientTombs.Mahrdis, destination = {x = 33126, y = 32591, z = 15}}, -- from Mahrdis Boss
	[3956]  = {storage = Storage.TheAncientTombs.Vashresamun, destination = {x = 33186, y = 33012, z = 14}}, -- from Vashresamun Boss
	[3950]  = {storage = Storage.TheAncientTombs.Morguthis, destination = {x = 33182, y = 32714, z = 14}}, -- from Morguthis Boss
	[3954]  = {storage = Storage.TheAncientTombs.Rahemos, destination = {x = 33041, y = 32774, z = 14}}, -- from Rahemos Boss
	[12108] = {storage = Storage.TheAncientTombs.Ashmunrah, destination = {x = 33198, y = 32880, z = 11}} -- from Ashmunrah Boss
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	local teleport = config[item.actionid]
	if not teleport then
		return true
	end

	if getGlobalStorageValue(teleport.storage) ~= 1 then
		player:teleportTo(fromPosition)
		fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
		player:say('You don\'t have killed the Pharaoh to enter this portal', TALKTYPE_MONSTER_SAY)
		return true
	end

	player:teleportTo(teleport.destination)
	teleport.destination:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

