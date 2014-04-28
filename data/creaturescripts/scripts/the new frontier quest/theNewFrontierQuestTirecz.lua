function onKill(cid, target)
	local monster = Monster(target)
	local player = Player(cid)
	if monster then
		if string.lower(monster:getName()) == "tirecz" then
			player:teleportTo({x = 33052, y = 31021, z = 7}, false)
			Position({x = 33052, y = 31021, z = 7}):sendMagicEffect(CONST_ME_TELEPORT)
			player:setStorageValue(1015, 26)
			player:say("You have won! As new champion take the ancient armor as reward before you leave.", TALKTYPE_ORANGE_1)
			clearArena({x = 33054, y = 31025, z = 3}, {x = 33075, y = 31045, z = 3})
		end
	end
	return true
end