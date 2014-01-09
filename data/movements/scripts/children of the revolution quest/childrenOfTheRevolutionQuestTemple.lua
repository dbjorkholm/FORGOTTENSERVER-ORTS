function onStepIn(cid, item, position, lastPosition)
	if(item.uid == 3163) then
		if(getPlayerStorageValue(cid, 1050) == 4) then
			setPlayerStorageValue(cid, 1050, 5)
			doCreatureSay(cid, "The temple has been corrupted and is lost. Zalamon should be informed about this as soon as possible.", TALKTYPE_ORANGE_1)
		end
	end
	return true
end
