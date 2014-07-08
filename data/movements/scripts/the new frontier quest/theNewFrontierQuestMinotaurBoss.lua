
function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	if(item.actionid == 12135) then
		if(player:getStorageValue(Storage.TheNewFrontier.Questline) == 18) then
			addEvent(function(cid) local player = Player(cid) if not player then return true end if player:getStorageValue(Storage.TheNewFrontier.Questline) == 19 then player:teleportTo({x = 33145, y = 31419, z = 7}) player:say("You have passed the test. Report to Curos.", TALKTYPE_ORANGE_1) end end, 2 * 60 * 1000, cid) -- 2 minutes
			player:setStorageValue(Storage.TheNewFrontier.Questline, 19)
			local destination = Position({x = 33154, y = 31415, z = 7})
			player:teleportTo(destination)
			destination:sendMagicEffect(CONST_ME_TELEPORT)
		else
			player:teleportTo(fromPosition)
			fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "You don't have access to this area.")
		end
	elseif(item.actionid == 12136) then
		player:setStorageValue(Storage.TheNewFrontier.Questline, 17)
		local destination = Position({x = 33146, y = 31414, z = 6})
		player:teleportTo(destination)
		destination:sendMagicEffect(CONST_ME_TELEPORT)
		player:say("You left the area. Ask Curos again for the mission!", TALKTYPE_ORANGE_1)
	end
	return true
end
