function onUse(cid, item, fromPosition, itemEx, toPosition) 
	Player(cid):addItem(ITEM_GOLD_COIN, 100)
	Item(item.uid):remove(1)
	return true
end
