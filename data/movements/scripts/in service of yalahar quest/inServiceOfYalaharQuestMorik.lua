function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	
	if item.uid == 3087 then
		if player:getStorageValue(Storage.InServiceofYalahar.Questline) == 51 then
			player:setStorageValue(Storage.InServiceofYalahar.Questline, 52)
			player:setStorageValue(Storage.InServiceofYalahar.Mission10, 3) -- StorageValue for Questlog "Mission 10: The Final Battle"
			player:say("It seems by defeating Azerus you have stopped this army from entering your world! Better leave this ghastly place forever.", TALKTYPE_MONSTER_SAY)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
	end
	return true
end
