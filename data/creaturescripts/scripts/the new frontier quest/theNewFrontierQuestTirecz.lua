function onKill(cid, target)
	local player = Player(cid)
	local monster = Monster(target)
	if monster then
		if string.lower(monster:getName()) == "tirecz" then
			Game.setStorageValue(12139, -1)
			clearArena({x = 33064, y = 31030, z = 3}, {x = 33085, y = 31050, z = 3})
			local spectators = Game.getSpectators(Position({x = 33074, y = 31039, z = 3}), false, true, 10, 10, 10, 10)
			if spectators ~= nil then
				for _, spectator in ipairs(spectators) do
					spectator:teleportTo({x = 33064, y = 31028, z = 7})
					spectator:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					spectator:say("You have won! As new champion take the ancient armor as reward before you leave.", TALKTYPE_ORANGE_1)
					if spectator:getStorageValue(1015) == 25 then
						spectator:setStorageValue(12139, 2) --Questlog, The New Frontier Quest "Mission 09: Mortal Combat"
						spectator:setStorageValue(1015, 26)
					end
				end
			end
		end
	end
	return true
end