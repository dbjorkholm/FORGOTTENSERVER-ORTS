local config = {
	storage = 3311,
	key_id = 2089, -- Key ID
	key_aid = 3301
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(config.storage) < 1 then
		local key = player:addItem(config.key_id, 1)
		key:setActionId(config.key_aid)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found a key.")
		player:setStorageValue(config.storage, 1)
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "The dead tree is empty.")
	end
	return true
end

