function onStepIn(cid, item, position, lastPosition)
	if(item.uid == 9014) then
		if (getPlayerStorageValue(cid, 200) >= 20) then
			doTeleportThing(cid, {x = 33168, y = 31683, z = 15})
			doSendMagicEffect({x = 33168, y = 31683, z = 15}, CONST_ME_TELEPORT)
		else
			doTeleportThing(cid, lastPosition)
			doSendMagicEffect(getCreaturePosition(cid),10)
		end
	end
	return true
end
