local pos = {
	{x = 33253, y = 31081, z = 8},
	{x = 33259, y = 31090, z = 8},
	{x = 33266, y = 31085, z = 8},
	{x = 33263, y = 31094, z = 8}
}

function doClearMissionArea(fromPos, toPos)
	for x = fromPos.x, toPos.x do
		for y = fromPos.y, toPos.y do
			for z = fromPos.z, toPos.z do
				if(getTopCreature({x = x, y = y, z = z}).uid > 0) then
					if(isPlayer(getTopCreature({x = x, y = y, z = z}).uid)) then
						doTeleportThing(getTopCreature({x = x, y = y, z = z}).uid, {x = 33353, y = 31410, z = 8})
						doSendMagicEffect({x = 33353, y = 31410, z = 8}, CONST_ME_TELEPORT)
						setPlayerStorageValue(getTopCreature({x = x, y = y, z = z}).uid, 1050, 20)
					else
						doRemoveCreature(getTopCreature({x = x, y = y, z = z}).uid)
					end
				end
			end
		end
	end
	return true
end

function onStepIn(cid, item, position, lastPosition)
	start = false
	if(getPlayerStorageValue(cid, 1050) == 19) then
		if(item.actionid == 8014) then
			for i = 1, 4 do
				if(getTopCreature(pos[i]).uid > 0) then
					if(isPlayer(getTopCreature(pos[i]).uid)) then
						if(getGlobalStorageValue(8014) < 1) then
							doCreatureSay(getTopCreature(pos[i]).uid, "A clicking sound tatters the silence.", TALKTYPE_ORANGE_1)
							start = true
						end
					end
				end
			end				
			if(start == true) then				
				doTransformItem(getTileItemById({x = 33265, y = 31116, z = 8}, 3653).uid), 3687)
				addEvent(doTransformItem, 30 * 1000, getTileItemById({x = 33265, y = 31116, z = 8}, 3687).uid), 3653)
				setGlobalStorageValue(8014, 1)
				addEvent(setGlobalStorageValue, 8014, 0)
				creature = ""
				for k = 1, 4 do
					for j = 1, 20 do
						if(k < 3) then
							creature = "eternal guardian"
						else
							creature = "lizard chosen"
						end
						summonPos = {x = math.random(33239, 33295), y = math.random(31100, 31132), z = 7}
						addEvent(doSummonCreature, k * 30 * 1000, creature, summonPos)
						addEvent(doSendMagicEffect, k * 30 * 1000, summonPos, CONST_ME_TELEPORT)
					end
				end
				addEvent(doClearMissionArea, 5 * 30 * 1000, {x = 33239, y = 31100, z = 7}, {x = 33295, y = 31132, z = 7})
			end
		end
	end
	return true
end
