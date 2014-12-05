function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not target:isItem() then
		return false
	end

	if target.uid == 3018 then
		if player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 60 then
			player:setStorageValue(Storage.ExplorerSociety.QuestLine, 61)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
	end
	return true
end