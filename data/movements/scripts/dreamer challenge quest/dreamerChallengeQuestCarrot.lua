function onStepIn(cid, item, position, fromPosition)
	if(item.uid == 2241) then
		if(getPlayerItemCount(cid, 2684) >= 1) then
			doTeleportThing(cid, {x = 32861, y = 32235, z = 9})
			doSendMagicEffect({x = 32861, y = 32235, z = 9}, CONST_ME_TELEPORT)
			doPlayerRemoveItem(cid, 2684, 1)
		else
			doTeleportThing(cid, fromPosition)
			doAreaCombatHealth(cid, COMBAT_FIREDAMAGE, fromPosition, 0, -10, -20, CONST_ME_HITBYFIRE)
			doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
		end
	elseif(item.uid == 2242) then
		doTeleportThing(cid, {x = 32861, y = 32240, z = 9})
		doSendMagicEffect({x = 32861, y = 32240, z = 9}, CONST_ME_TELEPORT)
	end
	return true
end