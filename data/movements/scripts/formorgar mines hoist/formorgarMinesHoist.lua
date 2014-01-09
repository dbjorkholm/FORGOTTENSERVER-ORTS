function onStepIn(cid, item, position, lastPosition)
	if(getPlayerStorageValue(cid, 470) == 1 and getPlayerStorageValue(cid, 471) == 1) then
		if(item.uid == 3059) then
			doTeleportThing(cid, {x = 32157, y = 31125, z = 10})
			doSendMagicEffect({x = 32157, y = 31125, z = 10}, CONST_ME_TELEPORT)
		elseif(item.uid == 3060) then
			if(getTileItemById({x = 32156, y = 31125, z = 10}, 1945).uid > 0) then
				doTeleportThing(cid, {x = 32157, y = 31125, z = 11})
				doSendMagicEffect({x = 32157, y = 31125, z = 11}, CONST_ME_TELEPORT)
			else
				doTeleportThing(cid, {x = 32157, y = 31125, z = 9})
				doSendMagicEffect({x = 32157, y = 31125, z = 9}, CONST_ME_TELEPORT)
			end
		elseif(item.uid == 3061) then
			doTeleportThing(cid, {x = 32157, y = 31125, z = 10})
			doSendMagicEffect({x = 32157, y = 31125, z = 10}, CONST_ME_TELEPORT)
		end
	else
		doTeleportThing(cid, lastPosition)
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You must first find the hoist instruction before using it.")
	end
	return true
end