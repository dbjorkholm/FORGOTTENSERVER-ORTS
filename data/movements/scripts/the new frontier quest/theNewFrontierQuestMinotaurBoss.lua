function onStepIn(cid, item, position, lastPosition)
	if(item.uid == 3155) then
		if(getPlayerStorageValue(cid, 1015) == 18) then
			addEvent(setPlayerStorageValue, 2 * 60 * 1000, cid, 1015, 19)
			addEvent(doTeleportThing, 2 * 60 * 1000, cid, lastPosition)
			doTeleportThing(cid, {x = 33153, y = 31416, z = 7})
			doSendMagicEffect({x = 33153, y = 31416, z = 7}, CONST_ME_TELEPORT)
			addEvent(doCreatureSay, 2 * 60 * 1000, cid, "You have passed the test. Report to Curos.", TALKTYPE_ORANGE_1)
		end
	end
	return true
end