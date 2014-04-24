function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.actionid == 4661 then
		local player = Player(cid)
		if player:getStorageValue(9928) == 1 and player:getStorageValue(9929) < 1 then
			player:setStorageValue(9929, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "An invisible hand pulls you inside.")
			player:teleportTo(Position({x = 33011, y = 32392, z = 10}))
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
		elseif player:getStorageValue(9930) == 1 and player:getStorageValue(9931) < 1 then
			player:setStorageValue(9931, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Get out of my room!")
			player:teleportTo(Position({x =  33008, y = 32392, z = 10}))
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
		end
	end
	return true
end