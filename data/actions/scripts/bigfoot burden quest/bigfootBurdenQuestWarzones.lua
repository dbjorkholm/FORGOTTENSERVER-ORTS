function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3143) then
		if(getGlobalStorageValue(item.uid) < 1) then
			setGlobalStorageValue(item.uid, 1)
			for i = 1, 6 do
				for k = 1, 10 do
					creatures = {
						"humongous fungus",
						"hideous fungus"
					}
					pos = {x = math.random(33091, 33101), y = math.random(31899, 31916), z = 10}
					addEvent(doSummonCreature, i * 20 * 1000, creatures[math.random(2)], pos)
					addEvent(doSendMagicEffect, i * 20 * 1000, pos, CONST_ME_TELEPORT)
				end
				addEvent(doCreatureSay, i * 20 * 1000, cid, "The crystals are charging.", TALKTYPE_ORANGE_1, false, cid, toPosition)
			end
			addEvent(doTransformItem, 6 * 20 * 1000, getTileItemById({x = 33104, y = 31908, z = 10}), 17999, 1387)
			addEvent(doTransformItem, 6 * 20 * 1000, getTileItemById({x = 33104, y = 31908, z = 10}), 1387, 17999)
			addEvent(doSummonCreature, 6 * 20 * 1000, "deathstrike", {x = 33100, y = 31955, z = 10})
			addEvent(doSendMagicEffect, 6 * 20 * 1000, {x = 33100, y = 31955, z = 10}, CONST_ME_TELEPORT)
			addEvent(teleportAllPlayersFromArea, 6 * 20 * 1000 + 30 * 60 * 1000, {
				{x = 33089, y = 31946, z = 10},
				{x = 33124, y = 31983, z = 10}
			}, {x = 33002, y = 31918, z = 10})
			addEvent(removeBoss, 6 * 20 * 1000 + 30 * 60 * 1000, {
				{x = 33089, y = 31946, z = 10},
				{x = 33124, y = 31983, z = 10}
			}, "deathstrike")
			addEvent(setGlobalStorageValue, 6 * 20 * 1000 + 30 * 60 * 1000, item.uid, 0)
		end
	end
	return true
end