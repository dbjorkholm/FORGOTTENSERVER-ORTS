local config = {
	[3311] = {2089, 3301},
	[3312] = {2088, 3302},
	[3313] = {2089, 3303}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local targetItem = config[item.uid]
	if not targetItem then
		return true
	end

	local player = Player(cid)
	if player:getStorageValue(item.uid) ~= 1 then
		local key = player:addItem(targetItem[1], 1)
		key:setActionId(targetItem[2])
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found a key.")
		player:setStorageValue(item.uid, 1)
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "The dead tree is empty.")
	end
	return true
end
