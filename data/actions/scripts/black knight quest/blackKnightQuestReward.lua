local config = {
	[3027] = {storageKey = 491, rewardId = 2487},
	[9055] = {storageKey = 490, rewardId = 2519}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local targetTree = config[item.uid]
	if not targetTree then
		return true
	end
	
	local player = Player(cid)
	if player:getStorageValue(targetTree.storageKey) ~= 1 then
		player:setStorageValue(targetTree.storageKey, 1)
		player:addItem(targetTree.rewardId, 1)
		player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. ItemType(targetTree.rewardId):getName() .. '.')
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The dead tree is empty.')
	end
	return true
end
