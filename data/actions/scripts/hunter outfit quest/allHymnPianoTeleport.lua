local portpos = Position({x = 32402, y = 32794, z = 9})

function onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)
	if(itemEx.actionid == 33216) then
		if player:getStorageValue(12050) == 1 and player:getStorageValue(12051) == 1 and player:getStorageValue(12052) == 1 and player:getStorageValue(12053) == 1 then
			player:teleportTo(portpos, false)
			portpos:sendMagicEffect(CONST_ME_TELEPORT)
			toPosition:sendMagicEffect(CONST_ME_SOUND_YELLOW)
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have not learned all the verses of the hymn")
			toPosition:sendMagicEffect(CONST_ME_POFF)
		end
	end
	return true
end