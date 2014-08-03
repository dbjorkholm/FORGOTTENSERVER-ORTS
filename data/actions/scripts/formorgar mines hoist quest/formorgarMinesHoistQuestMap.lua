local config = {
	[3057] = {storageKey = 471, itemId = 1954},
	[3058] = {storageKey = 470, itemId = 1954}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local useItem = config[item.uid]
	if not useItem then
		return true
	end

	local player = Player(cid)
	if player:getStorageValue(useItem.storageKey) > 0 then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty")
		return true
	end

	player:setStorageValue(useItem.storageKey, 1)
	player:addItem(useItem.itemId, 1)
	player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found a part of hoist instruction.")
	return true
end
