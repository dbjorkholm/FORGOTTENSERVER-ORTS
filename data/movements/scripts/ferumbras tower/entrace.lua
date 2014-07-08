function onStepIn(cid, item, position, fromPosition)
	if(getPlayerStorageValue(cid, 9005) < 2) then
		doTeleportThing(cid, fromPosition)
	elseif(getPlayerStorageValue(cid, 9005) == 2) then
		doTeleportThing(cid, )
		doSendMagicEffect(, CONST_ME_TELEPORT)
		setPlayerStorageValue(cid, 9005, 1)
	end
	return true
end