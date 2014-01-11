function onStepIn(cid, item, pos)

local amfora = {x = 32988, y = 32397, z = 9}
local amfora2 = {x = 32987, y = 32401, z = 9}

	if item.actionid == 4530 and (getPlayerStorageValue(cid,9995) == 1) and (getPlayerStorageValue(cid,9996) < 1) then
		doTeleportThing(cid,amfora2)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
	else
		doTeleportThing(cid,amfora)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
	end
	
	if item.actionid == 4531 then
		doTeleportThing(cid,amfora)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
	end

end