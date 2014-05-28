function onStepIn(cid, item, position, lastPosition)
	local player = Player(cid)
	if(item.actionid == 12135) then
		if(player:getStorageValue(1015) == 18) then
			addEvent(function() if(Player(cid):getStorageValue(1015) == 18) then Player(cid):setStorageValue(1015, 19) end end, 2 * 5 * 1000) -- 2 minutes
			addEvent(function() if(Player(cid):getStorageValue(1015) == 18) then Player(cid):teleportTo({x = 33145, y = 31419, z = 7}) end end, 2 * 5 * 1000) -- 2 minutes
			addEvent(function() if(Player(cid):getStorageValue(1015) == 18) then Player(cid):say("You have passed the test. Report to Curos.", TALKTYPE_ORANGE_1) end end, 2 * 5 * 1000) -- 2 minutes
			local destination = Position({x = 33154, y = 31415, z = 7})
			player:teleportTo(destination)
			destination:sendMagicEffect(CONST_ME_TELEPORT)
		else
			player:teleportTo(lastPosition)
			lastPosition:sendMagicEffect(CONST_ME_TELEPORT)
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "You don't have access to this area.")
		end
	elseif(item.actionid == 12136) then
		Player(cid):setStorageValue(1015, 17)
		local destination = Position({x = 33146, y = 31414, z = 6})
		player:teleportTo(destination)
		destination:sendMagicEffect(CONST_ME_TELEPORT)
		Player(cid):say("You left the area. Ask Curos again for the mission!", TALKTYPE_ORANGE_1)
	end
	return true
end