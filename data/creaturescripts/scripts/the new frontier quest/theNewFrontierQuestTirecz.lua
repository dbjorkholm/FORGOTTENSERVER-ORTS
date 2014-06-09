function onKill(cid, target)
	local player = Player(cid)
	local monster = Monster(target)
	if monster then
		if string.lower(monster:getName()) == "tirecz" then
			local deathpos = monster:getPosition()
			deathpos:sendMagicEffect(CONST_ME_TELEPORT)
			local portal = Game.createItem(1387, 1, deathpos)
			portal:setActionId(12133)
			addEvent(function(target) local portaltile = Tile(deathpos) if portaltile:getItemById(1387) then portaltile:getItemById(1387):remove() deathpos:sendMagicEffect(CONST_ME_POFF) Game.setStorageValue(3157, -1) end end, 1 * 60 * 1000, cid) -- 60 sec
			player:say("You have won! As new champion take the ancient armor as reward before you leave.", TALKTYPE_ORANGE_1)
			clearArena({x = 33064, y = 31030, z = 3}, {x = 33085, y = 31050, z = 3})
			--getplayers in the Area does not work :(
			--local WestX = 33065 -- WestX of Arena
			--local EastX = 33086 -- EastX of Arena
			--local NorthY = 31029 -- NorthY of Arena
			--local SouthY = 31050 -- SouthY of Arena
			--for allx = WestX, EastX do
            --    for ally = NorthY, SouthY do
			--		local getPlayers = Tile(Position({x = allx, y = ally, 3})):getTopCreature()
			--		if not getPlayers == nil then
			--			getPlayers:teleportTo({x = 33064, y = 31028, z = 7})
			--			getPlayers:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			--		end
			--	end
			--end
		end
	end
	return true
end