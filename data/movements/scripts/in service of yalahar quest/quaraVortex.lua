function onStepIn(cid, item, position, lastPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	
	local Helmetitem = player:getSlotItem(CONST_SLOT_HEAD)	
	if item.actionid == 7812 then
		if Helmetitem ~= nil and Helmetitem:getId() == 5461 then 
				local destination = Position({x = 32950, y = 31181, z = 9})
				player:teleportTo(destination)
				destination:sendMagicEffect(CONST_ME_WATERSPLASH)
				player:say("The vortex throws you out in this vicious place.", TALKTYPE_ORANGE_1)
		else
			player:teleportTo(lastPosition)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You must wear helmet of the deep in order to dive.")
		end
	end
	return true
end
