function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == ITEM_GOLD_COIN and item.type == ITEMCOUNT_MAX then
		doTransformItem(item.uid, ITEM_GOLD_COIN, item.type - item.type)
		doPlayerAddItem(cid, ITEM_PLATINUM_COIN, 1)
	elseif item.itemid == ITEM_PLATINUM_COIN and item.type == ITEMCOUNT_MAX then
		doTransformItem(item.uid, ITEM_PLATINUM_COIN, item.type - item.type)
		doPlayerAddItem(cid, ITEM_CRYSTAL_COIN, 1)
	elseif item.itemid == ITEM_PLATINUM_COIN and item.type < ITEMCOUNT_MAX then
		doTransformItem(item.uid, ITEM_PLATINUM_COIN, item.type - 1)
		doPlayerAddItem(cid, ITEM_GOLD_COIN, ITEMCOUNT_MAX)
	elseif item.itemid == ITEM_CRYSTAL_COIN then
		doTransformItem(item.uid, ITEM_CRYSTAL_COIN, item.type - 1)
		doPlayerAddItem(cid, ITEM_PLATINUM_COIN, ITEMCOUNT_MAX)
	else
		return FALSE
	end
	return TRUE
end