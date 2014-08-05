function onUse(cid, item, fromPosition, itemEx, toPosition)
	local targetItem = Item(itemEx.uid)
	if itemEx.uid == 2243 then --Dreamer Challenge Quest
		targetItem:transform(1387)
		toPosition:sendMagicEffect(CONST_ME_FIREAREA)
		Item(item.uid):remove(1)
	end

	local random = math.random(10)
	if random >= 4 then --success 6% chance
		if itemEx.itemid == 7538 then --Destroy spider webs/North - South
			toPosition:sendMagicEffect(CONST_ME_HITBYFIRE)
			targetItem:transform(7544)
			targetItem:decay()
		elseif itemEx.itemid == 7539 then --Destroy spider webs/EAST- West
			toPosition:sendMagicEffect(CONST_ME_HITBYFIRE)
			targetItem:transform(7545)
			targetItem:decay()
		elseif itemEx.itemid == 5466 then --Burn Sugar Cane
			toPosition:sendMagicEffect(CONST_ME_FIREAREA)
			targetItem:transform(5465)
			targetItem:decay()
		elseif itemEx.itemid == 1485 then --Light Up empty coal basins
			toPosition:sendMagicEffect(CONST_ME_HITBYFIRE)
			targetItem:transform(1484)
		end
	elseif random == 2 then --it remove the fire bug 2% chance
		Item(item.uid):remove(1)
		toPosition:sendMagicEffect(CONST_ME_POFF)
	elseif random == 1 then --it explode on the user 1% chance
		doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -5, -5, CONST_ME_HITBYFIRE)
		Player(cid):say('OUCH!', TALKTYPE_MONSTER_SAY)
		Item(item.uid):remove(1)
	else
		toPosition:sendMagicEffect(CONST_ME_POFF) --it fails, but dont get removed 3% chance
	end
	return true
end