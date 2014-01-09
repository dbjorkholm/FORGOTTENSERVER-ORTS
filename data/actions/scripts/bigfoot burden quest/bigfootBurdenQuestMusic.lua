function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(isInArray({3124, 3125, 3126, 3127}, item.uid)) then
		if(getPlayerStorageValue(cid, 900) == 12) then
			if(getPlayerStorageValue(cid, 903 + getPlayerStorageValue(cid, 911)) == item.uid) then
				setPlayerStorageValue(cid, 911, getPlayerStorageValue(cid, 911) + 1)
				doSendMagicEffect(toPosition, CONST_ME_FIREWORK_BLUE)
				if(getPlayerStorageValue(cid, 911) == 8) then
					setPlayerStorageValue(cid, 900, 13)
					doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have found your melody!")
				end
			else
				setPlayerStorageValue(cid, 911, 1)
				doSendMagicEffect(toPosition, CONST_ME_SOUND_RED)
			end
		end
	end
	return true
end
