function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if(item.itemid == 18336) then
		chance = math.random(15)
		if(player:getStorageValue(952) < 1 and player:getStorageValue(951) == 1) then
			if(chance == 15) then
				player:setStorageValue(952, player:getStorageValue(952) + 1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your skill allowed you to grab a whetstone before the stone sinks into lava.")
				player:addItem(18337, 1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You had no luck this time.")
			end
			toPosition:sendMagicEffect(CONST_ME_HITBYFIRE)
			Item(item.uid):transform(18335)
		end
	end
	return true
end