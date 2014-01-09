function onStepIn(cid, item, position, lastPosition)
	if(isPlayer(cid)) then
		if(getPlayerStorageValue(cid, item.uid - 10) < 1) then
			doTeleportThing(cid, lastPosition)
			doCreatureSay(cid, "You've not absorbed energy from this throne.", TALKTYPE_ORANGE_1)
		end
	end
	return true
end