function onUse(cid, item, fromPosition, itemEx, toPosition)
	local targetItem = Item(itemEx.uid)
	if itemEx.itemid == 5901 then
		targetItem:transform(10033)
		toPosition:sendMagicEffect(CONST_ME_POFF) --Not sure if there's any magic effect when you use saw?
	else
		return false
	end
	return true
end
