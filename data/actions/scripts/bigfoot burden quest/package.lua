function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	Item(item.uid):transform(item.itemid - 1)
	return true
end
