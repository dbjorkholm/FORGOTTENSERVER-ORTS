function onStepIn(cid, item, position, lastPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	
	if(item.uid == 3087) then
		if(player:getStorageValue(30) == 51) then
			player:setStorageValue(30, 52)
			player:setStorageValue(12021, 3) -- StorageValue for Questlog "Mission 10: The Final Battle"
			player:say("It seems by defeating Azerus you have stopped this army from entering your world! Better leave this ghastly place forever.", TALKTYPE_ORANGE_1)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
	end
	return true
end
