function onStepIn(cid, item, pos)

local sacrifici = {x = 33021, y = 32419, z = 11}
local sacrifici2 = {x = 33015, y = 32422, z = 11}

	if item.actionid == 4541 and (getPlayerStorageValue(cid,9948) == 1) then
		doTeleportThing(cid,sacrifici2)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
	else
		doTeleportThing(cid,sacrifici)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
	end
	
	if item.actionid == 4542 then
		doTeleportThing(cid,sacrifici)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
	end
	

end