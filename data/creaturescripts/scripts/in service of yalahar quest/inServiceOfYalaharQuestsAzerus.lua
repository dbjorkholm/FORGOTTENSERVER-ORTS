function onKill(cid, target)
	local monster = Monster(target)
	local deathpos = monster:getPosition()
	if monster then
		if string.lower(monster:getName()) == "azerus" then
			doCreateTeleport(1387, {x=32780, y=31168, z=14}, deathpos)
			deathpos:sendMagicEffect(CONST_ME_TELEPORT)
			monster:say("Azerus ran into teleporter! It will disappear in 2 minutes. Enter It!", TALKTYPE_MONSTER_SAY, 0, 0, deathpos)
			
			--remove portal after 2 min
			addEvent(function(target) 
				local portaltile = Tile(deathpos) 
				if portaltile:getItemById(1387) then 
					portaltile:getItemById(1387):remove() 
					deathpos:sendMagicEffect(CONST_ME_POFF) 
				end 
			end, 2 * 60 * 1000, target)
			
			--clean arena of monsters
			local othermonsters = Game.getSpectators(Position({x = 32783, y = 31166, z = 10}), false, false, 10, 10, 10, 10)
			if othermonsters ~= nil then
				for _, othermonster in ipairs(othermonsters) do
					if othermonster:isMonster() then
						othermonster:getPosition():sendMagicEffect(CONST_ME_POFF)
						othermonster:remove()
					end
				end
			end
			
		end
	end
	return true
end