function onKill(cid, target)
	target = Creature(target)
	if string.lower(target:getName()) == "parasite" and Game.getStorageValue(3144) < 1 then
		pos = {
			{x = 33097, y = 31976, z = 11},
			{x = 33097, y = 31977, z = 11},
			{x = 33097, y = 31978, z = 11},
			{x = 33097, y = 31979, z = 11}
		}
		local barrier = false
		for i = 1, 4 do
			if target:getPosition() == Position(pos[i].x, pos[i].y, pos[i].z) then
				barrier = true
			end
		end
		local last = false
		if barrier == true then
			for i = 1, 4 do
				barrier = {
					{x = 33098, y = 31976, z = 11},
					{x = 33098, y = 31977, z = 11},
					{x = 33098, y = 31978, z = 11},
					{x = 33098, y = 31979, z = 11}
				}
				if Tile(Position(barrier[i].x, barrier[i].y, barrier[i].z)):getItemById(18459) then
					doTransformItem(getTileItemById(barrier[i], 18459).uid, getTileItemById(barrier[i], 18459), 19460, 1)
				elseif Tile(Position(barrier[i].x, barrier[i].y, barrier[i].z)):getItemById(18460) then
					doTransformItem(getTileItemById(barrier[i], 18460).uid, getTileItemById(barrier[i], 18459), 19461, 1)
				elseif Tile(Position(barrier[i].x, barrier[i].y, barrier[i].z)):getItemById(18459) then
					Tile(Position(barrier[i].x, barrier[i].y, barrier[i].z)):getItemById(18461):remove(1)
					addEvent(Game.createItem(), 30 * 60 * 1000, 18459, 1, Position(barrier[i].x, barrier[i].y, barrier[i].z))
					last = true
				end
			end
		end
		if barrier == true and last == true then
			Game.setStorageValue(3144, 1)
			addEvent(Game.setStorageValue(), 30 * 60 * 1000, 3144, 0)
			Game.createMonster("gnomevil", Position(33114, 31953, 11))
			addEvent(teleportAllPlayersFromArea, 6 * 20 * 1000 + 30 * 60 * 1000, {
				{x = 33102, y = 31942, z = 11},
				{x = 33130, y = 31970, z = 11}
			}, {x = 33011, y = 31937, z = 11})
			addEvent(removeBoss, 6 * 20 * 1000 + 30 * 60 * 1000, {
				{x = 33102, y = 31942, z = 11},
				{x = 33130, y = 31970, z = 11}
			}, "gnomevil")
		end
	end
	return true
end