local config = {
	[3311] = 2089,
	[3312] = 2088,
	[3313] = 2089
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local useItem = config[item.uid]
	if not useItem then
		return true
	end

	local player = Player(cid)
	if player:getStorageValue(item.uid) ~= 1 then
		local key = player:addItem(useItem)
		if key then
			key:setActionId(item.uid - 10)
		end
		player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a key.')
		player:setStorageValue(item.uid, 1)
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, 'The dead tree is empty.')
	end
	return true
end
