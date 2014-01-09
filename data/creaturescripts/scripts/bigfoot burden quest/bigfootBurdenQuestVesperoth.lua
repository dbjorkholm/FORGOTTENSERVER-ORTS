function onKill(cid, target)
	if(string.lower(getCreatureName(target)) == "vesperoth") then
		setGlobalStorageValue(3147, 2)
		addEvent(setGlobalStorageValue, 30 * 60 * 1000, 3147, 0)
		doCreateItem(1387, 1, {x = 33075, y = 31878, z = 12})
		addEvent(doTransformItem, 30 * 60 * 1000, getTileItemById({x = 33075, y = 31878, z = 12}, 1387).uid, 18463)
		addEvent(teleportAllPlayersFromArea, 6 * 20 * 1000 + 30 * 60 * 1000, {
				{x = 33078, y = 31900, z = 12},
				{x = 33100, y = 31922, z = 12}
			}, {x = 32993, y = 31912, z = 12})
			addEvent(removeBoss, 6 * 20 * 1000 + 30 * 60 * 1000, {
				{x = 33078, y = 31900, z = 12},
				{x = 33100, y = 31922, z = 12}
			}, "abyssador")
		doSummonCreature("abyssador", {x = 33086, y = 31907, z = 12})
	end
	return true
end