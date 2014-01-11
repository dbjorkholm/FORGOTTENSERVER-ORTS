function onStepIn(cid, item, pos)

local dormitori = {x = 33018, y = 32437, z = 10}
local dormitori2 = {x = 33015, y = 32440, z = 10}

	if item.actionid == 4534 and (getPlayerStorageValue(cid,9931) == 1) and (getPlayerStorageValue(cid,9932) < 1) then
		setPlayerStorageValue(cid,9932,1)
		doTeleportThing(cid,dormitori2)
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You should hurry, try not to dwell here any longer than a few minutes.')
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
	else
		doTeleportThing(cid,dormitori)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
	end
	
	if item.actionid == 4535 then
		doTeleportThing(cid,dormitori)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
	end
	

end