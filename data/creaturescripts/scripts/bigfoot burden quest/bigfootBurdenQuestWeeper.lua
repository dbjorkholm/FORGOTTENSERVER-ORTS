function onKill(cid, target)
	if(string.lower(getCreatureName(target)) == "parasite" and getGlobalStorageValue(3144) < 1) then
		pos = {
			{x = 33097, y = 31976, z = 11},
			{x = 33097, y = 31977, z = 11},
			{x = 33097, y = 31978, z = 11},
			{x = 33097, y = 31979, z = 11}
		}
		barrier = false
		for i = 1, 4 do
			if(getCreaturePosition(target).x == pos[i].x and
				getCreaturePosition(target).y == pos[i].y and
				getCreaturePosition(target).z == pos[i].z
			) then
				barrier = true
			end
		end
		last = false
		if(barrier == true) then
			for i = 1, 4 do
				barrier = {
					{x = 33098, y = 31976, z = 11},
					{x = 33098, y = 31977, z = 11},
					{x = 33098, y = 31978, z = 11},
					{x = 33098, y = 31979, z = 11}
				}
				if(getTileItemById(barrier[i], 18459).uid > 0) then
					doTransformItem(getTileItemById(barrier[i], 18459).uid, getTileItemById(barrier[i], 18459), 19460, 1)
				elseif(getTileItemById(barrier[i], 18460).uid > 0) then
					doTransformItem(getTileItemById(barrier[i], 18460).uid, getTileItemById(barrier[i], 18459), 19461, 1)
				elseif(getTileItemById(barrier[i], 18459).uid > 0) then
					doRemoveItem(getTileItemById(barrier[i], 18461).uid, 1)
					addEvent(doCreateItem, 30 * 60 * 1000, 18459, 1, barrier[i])
					last = true
				end
			end
		end
		if(barrier == true and last == true) then
			setGlobalStorageValue(3144, 1)
			addEvent(setGlobalStorageValue, 30 * 60 * 1000, 3144, 0)
			doSummonCreature("gnomevil", {x = 33114, y = 31953, z = 11})
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