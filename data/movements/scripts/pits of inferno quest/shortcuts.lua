local storages = {
	[8816] = 8816,
	[8817] = 8817
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	local storage = storages[item.actionid]
	if player:getStorageValue(storage) ~= 1 then
		player:setStorageValue(storage, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You discovered a shortcut to the pits of inferno.')
	end
	return true
end
