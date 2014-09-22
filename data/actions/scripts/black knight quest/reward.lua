local config = {
	[3027] = {storage = Storage.QuestChests.BlackKnightTreeCrownArmor, rewardId = 2487},
	[9055] = {storage = Storage.QuestChests.BlackKnightTreeCrownShield, rewardId = 2519}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local targetTree = config[item.uid]
	if not targetTree then
		return true
	end

	local player = Player(cid)
	local cStorage = targetTree.storage
	if player:getStorageValue(cStorage) ~= 1 then
		player:setStorageValue(cStorage, 1)
		player:addItem(targetTree.rewardId, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a ' .. ItemType(targetTree.rewardId):getName() .. '.')
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The dead tree is empty.')
	end
	return true
end
