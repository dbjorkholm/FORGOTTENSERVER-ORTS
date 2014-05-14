function onUse(cid, item, fromPosition, itemEx, toPosition)
	local item = Item(item.uid)
	local itemTarget = Item(itemEx.uid)

	if itemEx.uid == 2243 then --Dreamer Challenge Quest
		itemTarget:transform(1387)
		toPosition:sendMagicEffect(CONST_ME_FIREAREA)
		item:remove(1)
	end

	if itemEx.itemid == 7538 then --Destroy spider webs/North - South
		toPosition:sendMagicEffect(CONST_ME_HITBYFIRE)
		itemTarget:transform(7544)
		itemTarget:decay()
		item:remove(1)
	elseif itemEx.itemid == 7539 then --Destroy spider webs/EAST- West
		toPosition:sendMagicEffect(CONST_ME_HITBYFIRE)
		itemTarget:transform(7545)
		itemTarget:decay()
		item:remove(1)
	end
	return true
end
