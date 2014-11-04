function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	local player, cStorage = player, Storage.secretService.RottenTree
	if player:getStorageValue(cStorage) ~= 1 then
		player:addItem(7736, 1)
		player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a rotten heart of a tree.')
		player:setStorageValue(cStorage, 1)
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, 'The dead tree is empty.')
	end
	return true
end
