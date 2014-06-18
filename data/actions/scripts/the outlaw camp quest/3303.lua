local storage = 3313

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(storage) < 1 then
		local key = player:addItem(2089, 1)
		key:setActionId(3303)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found a key.")
		player:setStorageValue(storage, 1)
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "The dead tree is empty.")
	end
	return true
end
