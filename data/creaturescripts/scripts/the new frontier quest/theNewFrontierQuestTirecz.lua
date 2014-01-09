function onKill(cid, target)
	if(isMonster(target)) then
		if(string.lower(getCreatureName(target)) == "tirecz") then
			doTeleportThing(cid, {x = 33052, y = 31021, z = 7})
			doSendMagicEffect({x = 33052, y = 31021, z = 7}, CONST_ME_TELEPORT)
			setPlayerStorageValue(cid, 1015, 26)
			doCreatureSay(cid, "You have won! As new champion take the ancient armor as reward before you leave.", TALKTYPE_ORANGE_1)
			clearArena({x = 33054, y = 31025, z = 3}, {x = 33075, y = 31045, z = 3})
		end
	end
	return true
end