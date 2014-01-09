function onStepIn(cid, item, position, lastPosition)
	if(item.uid == 3167) then
		if(getPlayerStorageValue(cid, 1050) >= 19) then
			doTeleportThing(cid, {x = 33257, y = 31116, z = 8})
			doSendMagicEffect({x = 33257, y = 31116, z = 8}, CONST_ME_TELEPORT)
		end
	elseif(item.uid == 3168) then
		if(getPlayerStorageValue(cid, 1050) >= 19) then
			doTeleportThing(cid, {x = 33356, y = 31125, z = 7})
			doSendMagicEffect({x = 33356, y = 31125, z = 7}, CONST_ME_TELEPORT)
		end
	end
	return true
end
