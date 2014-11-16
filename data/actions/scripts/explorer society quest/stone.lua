function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if itemEx.uid == 3015 and player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 54 then
		player:setStorageValue(Storage.ExplorerSociety.QuestLine, 55)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	elseif itemEx.uid == 3016 and player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 55 then
		player:setStorageValue(Storage.ExplorerSociety.QuestLine, 56)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	end
	return true
end