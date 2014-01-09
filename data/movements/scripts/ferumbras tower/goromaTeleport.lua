function onStepIn(cid, item, position, lastPosition)
	if(getPlayerStorageValue(cid, 9005) < 1) then
		setPlayerStorageValue(cid, 9005, 1)
	end
	doTeleportThing(cid, )
	doSendMagicEffect(, CONST_ME_TELEPORT)
	return true
end