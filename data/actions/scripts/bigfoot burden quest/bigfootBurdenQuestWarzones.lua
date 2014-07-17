function onUse(cid, item, fromPosition, itemEx, toPosition)
	local creatures = {
		"humongous fungus",
		"hideous fungus"
	}
	local player = Player(cid)
	if item.uid == 3143 then
		if Game.getStorageValue(item.uid) < 1 then
			Game.setStorageValue(item.uid, 1)
			for i = 1, 6 do
				for k = 1, 10 do
					local pos = {x = math.random(33091, 33101), y = math.random(31899, 31916), z = 10}
					addEvent(Game.createMonster(), i * 20 * 1000, creatures[math.random(2)], pos)
					addEvent(pos:sendMagicEffect(), i * 20 * 1000, CONST_ME_TELEPORT)
				end
				addEvent(player:say(), i * 20 * 1000, "The crystals are charging.", TALKTYPE_ORANGE_1, false, cid, toPosition)
			end
			addEvent(Tile(Position(33104, 31908, 10)):getItemById(17999):transform(), 6 * 20 * 1000, 1387)
			addEvent(Tile(Position(33104, 31908, 10)):getItemById(1387):transform(), 6 * 20 * 1000, 17999)
			addEvent(Game.createMonster(), 6 * 20 * 1000, "deathstrike", Position(33100, 31955, 10))
			addEvent(Position(33100, 31955, 10):sendMagicEffect(), 6 * 20 * 1000, CONST_ME_TELEPORT)
			addEvent(teleportAllPlayersFromArea, 6 * 20 * 1000 + 30 * 60 * 1000, {
				{x = 33089, y = 31946, z = 10},
				{x = 33124, y = 31983, z = 10}
			}, {x = 33002, y = 31918, z = 10})
			addEvent(removeBoss, 6 * 20 * 1000 + 30 * 60 * 1000, {
				{x = 33089, y = 31946, z = 10},
				{x = 33124, y = 31983, z = 10}
			}, "deathstrike")
			addEvent(Game.setStorageValue(), 6 * 20 * 1000 + 30 * 60 * 1000, item.uid, 0)
		end
	end
	return true
end