function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	
	if player:getStorageValue(item.uid) ~= 1 then
		player:addItem(7736, 1)
		player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a rotten heart of a tree.')
		player:setStorageValue(item.uid, 1)
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, 'The dead tree is empty.')
	end
	return true
end
