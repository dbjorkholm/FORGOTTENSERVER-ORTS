function onStepIn(cid, item, position, lastPosition)
	if(item.uid == 7809 and isPlayer(cid)) then
		if(getPlayerStorageValue(cid, 30) == 51) then
			doTeleportThing(cid, {x = 32783, y = 31174, z = 10})
			doSendMagicEffect({x = 32783, y = 31174, z = 10}, CONST_ME_TELEPORT)
			doCreatureSay(cid,"The apparatus in the centre looks odd! You should inspect it.", TALKTYPE_ORANGE_1)

		else
			doTeleportThing(cid, lastPosition)
		end
	elseif(item.uid == 7810 and isPlayer(cid)) then
		if(getGlobalStorageValue(982) < 1) then
			doTeleportThing(cid, {x = 32784, y = 31178, z = 9})
			doSendMagicEffect({x = 32784, y = 31178, z = 9}, CONST_ME_TELEPORT)
		else
			doTeleportThing(cid, lastPosition)
		end
	end
	return true
end
