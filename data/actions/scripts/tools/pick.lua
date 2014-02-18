function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (itemEx.uid <= 65535 or itemEx.actionid > 0) and (itemEx.itemid == 354 or itemEx.itemid == 355) then
		doTransformItem(itemEx.uid, 392)
		doDecayItem(itemEx.uid)
		doSendMagicEffect(toPosition, CONST_ME_POFF)
		return TRUE
	elseif(itemEx.itemid == 7200) then -- pick fragile ice --
		Item(itemEx.uid):transform(7236)
		Item(itemEx.uid):decay()
		Position(toPosition):sendMagicEffect(CONST_ME_HITAREA)
		return TRUE
	end
	return FALSE
end
