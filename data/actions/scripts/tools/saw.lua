function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid == 5901 then
		Item(itemEx.uid):transform(10033)
		toPosition:sendMagicEffect(CONST_ME_POFF) --Not sure if there's any magic effect when you use saw?
	end
	return true
end
