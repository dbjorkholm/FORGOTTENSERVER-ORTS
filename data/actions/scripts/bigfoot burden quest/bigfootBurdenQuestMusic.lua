function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if(isInArray({3124, 3125, 3126, 3127}, item.uid)) then
		if(player:getStorageValue(900) == 12) then
			if(player:getStorageValue(903 + player:getStorageValue(911)) == item.uid) then
				player:setStorageValue(911, player:getStorageValue(911) + 1)
				toPosition:sendMagicEffect(CONST_ME_FIREWORK_BLUE)
				if(player:getStorageValue(911) == 8) then
					player:setStorageValue(900, 13)
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found your melody!")
				end
			else
				player:setStorageValue(911, 1)
				toPosition:sendMagicEffect(CONST_ME_SOUND_RED)
			end
		end
	end
	return true
end
