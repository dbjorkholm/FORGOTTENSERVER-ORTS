function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
		if player:getSlotItem(CONST_SLOT_HEAD) == 5461 then
			player:teleportTo(Position(31914, 32713, 12))
			player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
			player:getPosition():sendMagicEffect(CONST_ME_LOSEENERGY)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You enter the realm of Calassa.")
		else
			player:teleportTo(fromPosition)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You must wear helmet of the deep in order to dive.")
		end
	return true
end
