local rewards = {2201, 2168}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(332) < 1 then
		player:setStorageValue(332, 1)
		local container = player:addItem(1987, 1)
		for i = 1, #rewards do
			container:addItem(rewards[i], 1)
		end
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found a bag.")
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
	end
	return true
end
