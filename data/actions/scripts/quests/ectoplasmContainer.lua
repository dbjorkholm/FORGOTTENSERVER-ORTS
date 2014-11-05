function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if itemEx.actionid == 4206 then
		if player:getStorageValue(Storage.TibiaTales.IntoTheBonePit) ~= 1 then
			return false
		end

		player:setStorageValue(Storage.TibiaTales.IntoTheBonePit, 2)
		Item(item.uid):transform(4864)
		Item(itemEx.uid):remove()
		toPosition:sendMagicEffect(CONST_ME_POFF)
	elseif itemEx.itemid == 2913 then
		if player:getStorageValue(Storage.ExplorerSociety.QuestLine) == 45 then
			player:setStorageValue(Storage.ExplorerSociety.QuestLine, 46)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			Item(item.uid):transform(4864)
			Item(itemEx.uid):remove()
		end
	end
	return true
end
