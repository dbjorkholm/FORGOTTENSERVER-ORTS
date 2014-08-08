local travel = {
	[7840] = {storage = 251, message = 'You visited Carlin. Now head to Edron.'},
	[7842] = {storage = 252, message = 'You visited Edron. Now head to Venore.'},
	[7843] = {storage = 253, message = 'You visited Venore. Now head to Cormaya.'},
	[7844] = {storage = 254, message = 'You visited Cormaya. Now head to the Kevin\'s Post Office.'},
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	local config = travel[item.actionid]
	if player:getStorageValue(config.storage) < 1 then
		player:setStorageValue(config.storage, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.message)
	end
	return true
end