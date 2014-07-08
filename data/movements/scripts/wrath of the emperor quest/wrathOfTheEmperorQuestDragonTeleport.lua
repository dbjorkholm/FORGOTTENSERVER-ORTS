function onStepIn(cid, item, position, fromPosition)
	if(isPlayer(cid)) then
		if(getPlayerStorageValue(cid, 1084) == 1) then
			doTeleportThing(cid, {x = 33243, y = 31237, z = 10})
			doSendMagicEffect({x = 33243, y = 31237, z = 10}, CONST_ME_TELEPORT)
		else
			doTeleportThing(cid, fromPosition)
		end
	else
		doTeleportThing(cid, fromPosition)
	end
	return true
end
