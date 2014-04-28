local config = {
	storage = 9136,
	key_id = 2091, -- Key ID
	key_aid = 3980
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(config.storage) < 1 then
		local key = player:addItem(config.key_id, 1)
		key:setActionId(config.key_aid)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found a key.")
		player:setStorageValue(config.storage, 1)
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "The small hole is empty.")
	end
	return true
end