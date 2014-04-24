local rewards = {2432, 2214, 2201, 2145}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(319) < 1 then
		player:setStorageValue(319, 1)
		local bag = player:addItem(1987, 1)
		local container = Container(bag:getUniqueId())
		for i = 1, #rewards do
			container:addItem(rewards[i], 1)
		end
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a bag.")
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
	end
	return true
end
