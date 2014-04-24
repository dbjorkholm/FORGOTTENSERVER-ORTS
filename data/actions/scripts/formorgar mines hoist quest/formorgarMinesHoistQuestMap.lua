local config = {
	[3057] = {471, 1954},
	[3058] = {470, 1954}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	local targetItem = config[item.uid]
	if not targetItem then
		return true
	end
	
	if player:getStorageValue(targetItem[1]) > 0 then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty")
		return true
	end
	
	player:setStorageValue(targetItem[1], 1)
	player:addItem(targetItem[2], 1)
	player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a part of hoist instruction.")
	return true
end