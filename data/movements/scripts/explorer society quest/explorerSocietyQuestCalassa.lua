function onStepIn(cid, item, position, lastPosition)
	if(item.actionid == 2070) then
	local player = Player(cid)
		if(getPlayerSlotItem(cid, CONST_SLOT_HEAD).itemid == 5461) then
			player:teleportTo({x = 31914, y = 32713, z = 12})
			player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
			player:getPosition():sendMagicEffect(CONST_ME_LOSEENERGY)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You enter the realm of Calassa.")
		else
			player:teleportTo(lastPosition)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You must wear helmet of the deep in order to dive.")
		end
	end
	return true
end