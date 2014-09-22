local config = {
	[3062] = {itemId = 8262, storage = Storage.QuestChests.KosheiAmulet1},
	[3064] = {itemId = 8264, storage = Storage.QuestChests.KosheiAmulet2}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local useItem = config[item.uid]
	if not useItem then
		return true
	end

	local player = Player(cid)
	local cStorage = useItem.storage
	if player:getStorageValue(cStorage) ~= 1 then
		player:setStorageValue(cStorage, 1)
		player:addItem(useItem.itemId, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a piece of an amulet.')
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The ' .. ItemType(item.itemid):getName() .. ' is empty.')
	end
	return true
end