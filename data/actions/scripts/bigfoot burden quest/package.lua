function onUse(cid, item, fromPosition, itemEx, toPosition)
	Item(item.uid):transform(item.itemid - 1)
	return true
end
