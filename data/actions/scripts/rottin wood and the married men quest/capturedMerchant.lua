function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	player:addItem(ITEM_GOLD_COIN, 100)
	Item(item.uid):remove(1)
	return true
end
