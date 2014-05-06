function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.actionid == 12125 then
	local player = Player(cid)
		if item.itemid == 4875 then --Egg reward
			if player:getStorageValue(12125) == 1 then
				player:setStorageValue(12125, 2) -- The Ape City Questlog - Mission 3: Lizard Parchment
				player:addItem(4850, 1)
				player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found a Hydra Egg.")
			end
		end
	end
	return true
end
