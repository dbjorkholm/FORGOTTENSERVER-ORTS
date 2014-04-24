local config = {
	[3953] = {12101, {x = 33145, y = 32665, z = 15}}, -- from Omruc Boss
	[3951] = {12102, {x = 33174, y = 32934, z = 15}}, -- from Thalas Boss
	[3955] = {12103, {x = 33349, y = 32827, z = 14}}, -- from  Dipthrah Boss
	[3952] = {12104, {x = 33126, y = 32591, z = 15}}, -- from Mahrdis Boss
	[3956] = {12105, {x = 33186, y = 33012, z = 14}}, -- from Vashresamun Boss
	[3950] = {12106, {x = 33182, y = 32714, z = 14}}, -- from Morguthis Boss
	[3954] = {12107, {x = 33041, y = 32774, z = 14}}, -- from Rahemos Boss
	[12108] = {12108, {x = 33198, y = 32880, z = 11}} -- from Ashmunrah Boss
}

function onStepIn(cid, item, position, lastPosition)
		local player = Player(cid)
		local teleports = config[item.actionid]
		if not teleports then
			return true
		end
		if(getGlobalStorageValue(teleports[1]) == 1) then
			player:teleportTo(teleports[2])
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		else
			player:teleportTo(lastPosition)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:say("You don\'t have killed the Pharaoh to enter this portal", TALKTYPE_ORANGE_1)
		end
	return true
end

