function onStepIn(cid, item, position, lastPosition)
	if(item.uid == 3166) then
		if(getPlayerStorageValue(cid, 1050) == 13) then
			setPlayerStorageValue(cid, 1050, 14)
			doCreatureSay(cid, "A part of the floor before you displays an arrangement of strange symbols.", TALKTYPE_ORANGE_1)
		end
	end
	return true
end
