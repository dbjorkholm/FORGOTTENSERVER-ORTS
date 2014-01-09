function onStepIn(cid, item, position, lastPosition)
	if(item.actionid == 2070) then
		if(getPlayerSlotItem(cid, CONST_SLOT_HEAD).itemid == 5461) then
			doTeleportThing(cid, {x = 31914, y = 32713, z = 6})
			doSendMagicEffect({x = 31914, y = 32713, z = 6}, CONST_ME_TELEPORT)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You enter the realm of Calassa.")
		else
			doTeleportThing(cid, lastPosition)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You must wear helmet of the deep in order to dive.")
		end
	end
	return true
end