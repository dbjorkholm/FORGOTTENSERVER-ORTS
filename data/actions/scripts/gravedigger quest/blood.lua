local config = {
	[4644] = {storageKey = {9978, 9979}, message = 'The blood in the vial is of a deep, ruby red.', itemId = 21418},
	[4645] = {storageKey = {9979, 9980}, message = 'The blood in the vial is of a strange colour, as if tainted.', itemId = 21419}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local targetItem = config[itemEx.actionid]
	if not targetItem then
		return true
	end

	local player = Player(cid)
	if player:getStorageValue(targetItem.storageKey[1]) == 1 and player:getStorageValue(targetItem.storageKey[2]) < 1 then
		player:setStorageValue(targetItem.storageKey[2], 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, targetItem.message)
		player:addItem(targetItem.itemId, 1)
		Item(item.uid):remove(1)
	end
	return true
end