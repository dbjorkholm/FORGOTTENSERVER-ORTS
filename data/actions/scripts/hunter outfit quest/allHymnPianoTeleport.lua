local portpos = {x = 32402, y = 32794, z = 9}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(itemEx.actionid == 33216) then
		if(Player(cid):getStorageValue(12050) == 1 and Player(cid):getStorageValue(12051) == 1 and Player(cid):getStorageValue(12052) == 1 and Player(cid):getStorageValue(12053) == 1) then
			Player(cid):teleportTo(portpos, false)
			Position(portpos):sendMagicEffect(CONST_ME_TELEPORT)
			Position(toPosition):sendMagicEffect(CONST_ME_SOUND_YELLOW)
		else
			Player(cid):sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have not learned all the verses of the hymn")
			Position(toPosition):sendMagicEffect(CONST_ME_POFF)
		end
	end
	return true
end