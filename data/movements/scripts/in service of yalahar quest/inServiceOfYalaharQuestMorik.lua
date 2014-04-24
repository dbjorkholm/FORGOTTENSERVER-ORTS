function onStepIn(cid, item, position, lastPosition)
	if(item.uid == 3087) then
		if(getPlayerStorageValue(cid, 30) == 51) then
			setPlayerStorageValue(cid, 30, 52)
			Player(cid):setStorageValue(12021, 3) -- StorageValue for Questlog "Mission 10: The Final Battle"
			doCreatureSay(cid, "It seems by defeating Azerus you have stopped this army from entering your world! Better leave this ghastly place forever.", TALKTYPE_ORANGE_1)
			doSendMagicEffect(getPlayerPosition(cid), CONST_ME_MAGIC_BLUE)
		end
	end
	return true
end
