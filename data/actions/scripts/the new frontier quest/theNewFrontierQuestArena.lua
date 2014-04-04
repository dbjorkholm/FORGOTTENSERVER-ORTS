function onUse(cid, item, fromPosition, itemEx, toPosition)
	boss = {
		"Baron Brute",
		"The Axeorcist",
		"Menace",
		"Fatality",
		"Incineron",
		"Coldheart",
		"Dreadwing",
		"Doomhowl",
		"Haunter",
		"The Dreadorian",
		"Rocko",
		"Tremorak"
	}
	pos = {
		{x = 33075, y = 31045, z = 3},
		{x = 33063, y = 31034, z = 3}
	}
	local player = Player(cid)
	
	if(item.uid == 3157) then
		if(getGlobalStorageValue(3157) < 1) then
			if(getPlayerPosition(cid).x == 33080 and player:getPosition().y == 31014 and player:getPosition().z == 2 and getTopCreature({x = 33081, y = 31014, z = 2}).uid > 0) then
				setGlobalStorageValue(3157, 1)
				addEvent(clearArena, 30 * 60 * 1000, {x = 33054, y = 31025, z = 3}, {x = 33075, y = 31045, z = 3})
				doTeleportThing(pos[1])
				doSendMagicEffect(pos[1], CONST_ME_TELEPORT)
				doTeleportThing(getTopCreature({x = 33081, y = 31014, z = 2}).uid, pos[2])
				doSendMagicEffect(pos[2], CONST_ME_TELEPORT)
			else
				return true
			end
			for i = 1, 6 do
				for k = 1, 2 do
					addEvent(doSummonCreature, i * 90 * 10000, bosses[i + k], pos[k])
					addEvent(doSendMagicEffect, i * 90 * 10000, pos[k], CONST_ME_TELEPORT)
				end
			end
			addEvent(doSummonCreature, 7 * 90 * 10000, "Tirecz", pos[1])
			addEvent(doSendMagicEffect, 7 * 90 * 10000, pos[1], CONST_ME_TELEPORT)
		end
	end
	return true
end