local config = {
	[3311] = 2089,
	[3312] = 2088,
	[3313] = 2089
}

function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	local useItem = config[item.uid]
	if not useItem then
		return true
	end

	if player:getStorageValue(item.uid) ~= 1 then
		local key = player:addItem(useItem)
		if key then
			key:setActionId(item.uid - 10)
		end
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a key.')
		player:setStorageValue(item.uid, 1)
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The dead tree is empty.')
	end
	return true
end
