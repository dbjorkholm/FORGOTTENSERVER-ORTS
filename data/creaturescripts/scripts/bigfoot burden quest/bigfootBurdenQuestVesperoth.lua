function onKill(cid, target)
	target = Creature(target)
	if string.lower(target:getName()) == "vesperoth" then
		Game.setGlobalStorage(3147, 2)
		addEvent(Game.setGlobalStorage(), 30 * 60 * 1000, 3147, 0)
		Game.createItem(1387, 1 Position(33075, 31878, 12))
		addEvent(Tile(Position(33075, 31878, 12)):getItemById(1387):transform(), 30 * 60 * 1000, 18463)
		addEvent(teleportAllPlayersFromArea, 6 * 20 * 1000 + 30 * 60 * 1000, {
				{x = 33078, y = 31900, z = 12},
				{x = 33100, y = 31922, z = 12}
			}, {x = 32993, y = 31912, z = 12})
			addEvent(removeBoss, 6 * 20 * 1000 + 30 * 60 * 1000, {
				{x = 33078, y = 31900, z = 12},
				{x = 33100, y = 31922, z = 12}
			}, "abyssador")
		Game.createMonster("abyssador", Position(33086, 31907, 12))
	end
	return true
end