function onStepIn(cid, item, position, lastPosition)
	if(isMonster(cid)) then
		if(string.lower(getCreatureName(cid)) == "the keeper") then
			if(item.itemid == 12334) then
				doTargetCombatHealth(cid, cid, COMBAT_PHYSICALDAMAGE, 100, 400, CONST_ME_BIGPLANTS)
				doTransformItem(item.uid, 12335)
				addEvent(doTransformItem, math.random(10, 30) * 1000, item.uid, 12334)
			end
		end
	end
	return true
end
