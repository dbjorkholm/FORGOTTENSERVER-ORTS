local config = {
	[3062] = 8262,
	[3064] = 8264
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local useItem = config[item.uid]
	if not useItem then
		return true
	end
	
	local player = Player(cid)
	if player:getStorageValue(item.uid) ~= 1 then
		player:setStorageValue(item.uid, 1)
		player:addItem(useItem, 1)
		player:sendTextMessage(MESSAGE_INFO_DESCR, 'You\'ve found a piece of an amulet.')
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, 'The ' .. ItemType(item.itemid):getName() .. ' is empty.')
	end
	return true
end