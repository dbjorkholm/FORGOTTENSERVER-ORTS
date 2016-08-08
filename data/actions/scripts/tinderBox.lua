function onUse(player, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 22721) then
		if(itemEx.itemid == 22720) then
			end
		end
		item:remove()
		itemEx:remove()
		player:addItem(22719, 1)
	return true
end
