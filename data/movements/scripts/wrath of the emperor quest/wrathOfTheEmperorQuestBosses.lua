local pos = {
	[3189] = {x = 33041, y = 31086, z = 15},
	[3190] = {x = 33091, y = 31083, z = 15},
	[3191] = {x = 33094, y = 31123, z = 15},
	[3192] = {x = 33038, y = 31119, z = 15},
}

function onStepIn(cid, item, position, fromPosition)
	if(getPlayerStorageValue(cid, 1090) == item.uid - 3188)
		if(getGlobalStorage(item.uid) < 1) then
			doTeleportThing(cid, pos[item.uid])
			doSendMagicEffect(pos[item.uid], CONST_ME_TELEPORT)
		else
			doTeleportThing(cid, fromPosition)
		end
	else
		doTeleportThing(cid, fromPosition)
	end
	return true
end
