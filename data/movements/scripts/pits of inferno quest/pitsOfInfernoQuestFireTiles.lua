local tiles = {
	[2040] = {voc = 1, damage = 300},
	[2041] = {voc = 1, damage = 600},
	[2042] = {voc = 1, damage = 1200},
	[2043] = {voc = 1, damage = 2400},
	[2044] = {voc = 1, damage = 3600},
	[2045] = {voc = 1, damage = 7200},
	
	[2046] = {voc = 2, damage = 300},
	[2047] = {voc = 2, damage = 600},
	[2048] = {voc = 2, damage = 1200},
	[2049] = {voc = 2, damage = 2400},
	[2050] = {voc = 2, damage = 3600},
	[2051] = {voc = 2, damage = 7200},
	
	[2052] = {voc = 3, damage = 300},
	[2053] = {voc = 3, damage = 600},
	[2054] = {voc = 3, damage = 1200},
	[2055] = {voc = 3, damage = 2400},
	[2056] = {voc = 3, damage = 3600},
	[2057] = {voc = 3, damage = 7200},
	
	[2058] = {voc = 4, damage = 300},
	[2059] = {voc = 4, damage = 600},
	[2060] = {voc = 4, damage = 1200},
	[2061] = {voc = 4, damage = 2400},
	[2062] = {voc = 4, damage = 3600},
	[2063] = {voc = 4, damage = 7200}
}



function onStepIn(cid, item, position, fromPosition)
	if(tiles[item.actionid]) then
		if(isInArray({tiles[item.actionid].voc, tiles[item.actionid].voc + 4}, getPlayerVocation(cid)) == false) then
			damage = COMBAT_FIREDAMAGE
			if(tiles[item.actionid].damage > 300) then
				damage = COMBAT_PHYSICALDAMAGE
			end
			doTargetCombatHealth(0, cid, damage, -tiles[item.actionid].damage, -tiles[item.actionid].damage, CONST_ME_FIREATTACK)
		else
			doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -300, -300, CONST_ME_HITBYFIRE)
		end
	end
	return true
end