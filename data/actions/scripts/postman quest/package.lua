function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if itemEx.actionid == 101 and itemEx.itemid == 2334 then
		if player:getStorageValue(Storage.postman.Mission09) == 2 then
			player:setStorageValue(Storage.postman.Mission09, 3)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
			Item(item.uid):transform(1993)
		end
	end
	return true
end
