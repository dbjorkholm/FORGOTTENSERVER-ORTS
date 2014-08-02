local bosses = {
	['fury of the emperor'] =  {position = Position(33049, 31089, 15), storage = 3189},
	['wrath of the emperor'] = {position = Position(33095, 31090, 15), storage = 3190},
	['scorn of the emperor'] = {position = Position(33095, 31114, 15), storage = 3191},
	['spite of the emperor'] = {position = Position(33049, 31115, 15), storage = 3192},
}

function onKill(cid, target)
	local targetMonster = Monster(target)
	if not targetMonster then
		return true
	end

	local bossConfig = bosses[targetMonster:getName():lower()]
	if not bossConfig then
		return true
	end

	Game.setStorageValue(bossConfig.storage, 0)
	local tile = Tile(bossConfig.position)
	if tile then
		local thing = tile:getItemById(11753)
		if thing then
			thing:transform(12383)
		end
	end
	return true
end