function onKill(cid, target)
	local azerus = Monster(target)
	if azerus and string.lower(azerus:getName()) == "azerus" then
		local deathpos = azerus:getPosition()
		doCreateTeleport(1387, {x=32780, y=31168, z=14}, deathpos)
		deathpos:sendMagicEffect(CONST_ME_TELEPORT)
		azerus:say("Azerus ran into teleporter! It will disappear in 2 minutes. Enter It!", TALKTYPE_MONSTER_SAY, 0, 0, deathpos)
		
		--remove portal after 2 min
		addEvent(function() 
			local portaltile = Tile(deathpos) 
			if portaltile:getItemById(1387) then 
				portaltile:getItemById(1387):remove() 
				deathpos:sendMagicEffect(CONST_ME_POFF) 
			end 
		end, 2 * 60 * 1000)
		
		--clean arena of monsters
		local othermonsters = Game.getSpectators(Position({x = 32783, y = 31166, z = 10}), false, false, 10, 10, 10, 10)
		for _, othermonster in ipairs(othermonsters) do
			if othermonster:isMonster() then
				othermonster:getPosition():sendMagicEffect(CONST_ME_POFF)
				othermonster:remove()
			end
		end
	end
	return true
end