local config = {
	[4644] = {9978, 9979, "The blood in the vial is of a deep, ruby red.", 21418},
	[4645] = {9979, 9980, "The blood in the vial is of a strange colour, as if tainted.", 21419}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	local targetItem = config[itemEx.actionid]
	if not targetItem then
		return true
	end
	
	if player:getStorageValue(targetItem[1]) == 1 and player:getStorageValue(targetItem[2]) < 1 then
		player:setStorageValue(targetItem[2], 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("%s", targetItem[3]))
		player:addItem(targetItem[4], 1)
		Item(item.uid):remove(1)
	end
	return true
end