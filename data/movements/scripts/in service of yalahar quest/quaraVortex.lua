function onStepIn(cid, item, position, lastPosition)
	if(item.actionid == 7812) then
		if(getPlayerSlotItem(cid, CONST_SLOT_HEAD).itemid == 5461) then
			doTeleportThing(cid, {x = 32950, y = 31181, z = 9})
			doCreatureSay(cid, "The vortex throws you out in this vicious place.", TALKTYPE_ORANGE_1)
			doSendMagicEffect({x = 32950, y = 31181, z = 9}, CONST_ME_WATERSPLASH)
		else
			doTeleportThing(cid, lastPosition)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You must wear helmet of the deep in order to dive.")
		end
	end
	return true
end
