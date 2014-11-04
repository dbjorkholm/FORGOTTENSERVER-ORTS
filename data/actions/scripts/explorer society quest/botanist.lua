function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if itemEx.itemid == 4138 and player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 16 then
		player:setStorageValue(Storage.ExplorerSociety.QuestLine, 17)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		Item(item.uid):transform(4870)
		Item(itemEx.uid):remove()
	elseif itemEx.itemid == 4149 and player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 19 then
		player:setStorageValue(Storage.ExplorerSociety.QuestLine, 20)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		Item(item.uid):transform(4871)
		Item(itemEx.uid):remove()
	elseif itemEx.itemid == 4242 and player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 24 then
		player:setStorageValue(Storage.ExplorerSociety.QuestLine, 25)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		Item(item.uid):transform(4872)
		Item(itemEx.uid):remove()
	elseif itemEx.itemid == 5659 and player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 24 then
		player:setStorageValue(Storage.ExplorerSociety.QuestLine, 25)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_RED)
		Item(item.uid):transform(5937)
	end
	return true
end