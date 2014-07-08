local teleports = {
	[3178] = {storage = 6, pos = {x = 33137, y = 31248, z = 6}},
	[3179] = {storage = 6, pos = {x = 33211, y = 31068, z = 9}},
	[3180] = {storage = 6, pos = {x = 33211, y = 31068, z = 9}},

function onStepIn(cid, item, position, fromPosition)
	if(isPlayer(cid)) then
		if(getPlayerStorageValue(cid, 1060) >= teleports[item.uid].storage) then
			doTeleportThing(cid, teleports[item.uid].pos)
			doSendMagicEffect(teleports[item.uid].pos, CONST_ME_TELEPORT)
		else
			doTeleportThing(cid, fromPosition)
		end
	end
	return true
end
