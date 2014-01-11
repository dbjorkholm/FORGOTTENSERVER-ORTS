function onStepIn(cid, item, pos)

local brain = {x = 33022, y = 32338, z = 10}
local brain2 = {x = 33022, y = 32334, z = 10}

	if item.actionid == 4532 and (getPlayerStorageValue(cid,9998) == 1) and (getPlayerStorageValue(cid,9999) < 1) then
		doTeleportThing(cid,brain2)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
	else
		doTeleportThing(cid,brain)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
	end
	
	if item.actionid == 4533 then
		doTeleportThing(cid,brain)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
	end
	

end