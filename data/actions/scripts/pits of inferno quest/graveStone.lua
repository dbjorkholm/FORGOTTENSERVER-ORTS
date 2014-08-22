function onUse(cid, item, fromPosition, itemEx, toPosition)
	local tile = Position(32791, 32333, 9):getTile()
	if tile then
		local thing = tile:getItemById(2016, 2)
		if thing then
			thing:remove()
			local player = Player(cid)
			local playerPos = player:getPosition()
			playerPos:sendMagicEffect(CONST_ME_DRAWBLOOD)
			player:teleportTo(Position(32791, 32332, 10))
			player:say('Muahaha..', TALKTYPE_MONSTER_SAY)
			playerPos:sendMagicEffect(CONST_ME_MORTAREA)
		end
	end
	return true
end
