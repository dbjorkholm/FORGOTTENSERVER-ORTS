function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if itemEx.itemid == 4995 and itemEx.uid == 3000 and player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 5 then
		player:setStorageValue(Storage.ExplorerSociety.QuestLine, 6)
		player:addItem(4848, 1)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	end
	return true
end