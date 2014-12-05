function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not target:isItem() then
		return false
	end

	if target.itemid == 4313 and player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 11 then -- blue butterfly
		player:setStorageValue(Storage.ExplorerSociety.QuestLine, 12)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		item:transform(4866)
		target:remove()
	elseif target.itemid == 4313 and player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 14 then -- red butterfly
		player:setStorageValue(Storage.ExplorerSociety.QuestLine, 15)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		item:transform(4867)
		target:remove()
	elseif target.itemid == 4313 and player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 8 then -- purple butterfly
		player:setStorageValue(Storage.ExplorerSociety.QuestLine, 9)
		toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		item:transform(4868)
		target:remove()
	end
	return true
end