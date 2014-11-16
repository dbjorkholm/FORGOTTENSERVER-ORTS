local config = {
	[3953]  = {storage = Storage.TheAncientTombs.Omruc, destination = Position(33145, 32665, 15)}, -- from Omruc Boss
	[3951]  = {storage = Storage.TheAncientTombs.Thalas, destination = Position(33174, 32934, 15)}, -- from Thalas Boss
	[3955]  = {storage = Storage.TheAncientTombs.Diphtrah, destination = Position(33349, 32827, 14)}, -- from  Dipthrah Boss
	[3952]  = {storage = Storage.TheAncientTombs.Mahrdis, destination = Position(33126, 32591, 15)}, -- from Mahrdis Boss
	[3956]  = {storage = Storage.TheAncientTombs.Vashresamun, destination = Position(33186, 33012, 14)}, -- from Vashresamun Boss
	[3950]  = {storage = Storage.TheAncientTombs.Morguthis, destination = Position(33182, 32714, 14)}, -- from Morguthis Boss
	[3954]  = {storage = Storage.TheAncientTombs.Rahemos, destination = Position(33041, 32774, 14)}, -- from Rahemos Boss
	[12108] = {storage = Storage.TheAncientTombs.Ashmunrah, destination = Position(33198, 32880, 11)} -- from Ashmunrah Boss
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local teleport = config[item.actionid]
	if not teleport then
		return true
	end

	if Game.getStorageValue(teleport.storage) ~= 1 then
		player:teleportTo(fromPosition)
		fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
		player:say('You don\'t have killed the Pharaoh to enter this portal', TALKTYPE_MONSTER_SAY)
		return true
	end

	player:teleportTo(teleport.destination)
	teleport.destination:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

