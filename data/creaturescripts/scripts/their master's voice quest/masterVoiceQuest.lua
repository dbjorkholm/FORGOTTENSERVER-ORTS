local magePos = {
	{x = 33328, y = 31859, z = 9},
	{x = 33367, y = 31873, z = 9},
	{x = 33349, y = 31899, z = 9}
}

local pos = {
	{x = 33313, y = 31852, z = 9},
	{x = 33313, y = 31865, z = 9},
	{x = 33313, y = 31881, z = 9},
	{x = 33328, y = 31860, z = 9},
	{x = 33328, y = 31873, z = 9},
	{x = 33328, y = 31885, z = 9},
	{x = 33308, y = 31873, z = 9},
	{x = 33320, y = 31873, z = 9},
	{x = 33335, y = 31873, z = 9},
	{x = 33360, y = 31873, z = 9},
	{x = 33336, y = 31914, z = 9},
	{x = 33343, y = 31914, z = 9},
	{x = 33353, y = 31914, z = 9},
	{x = 33361, y = 31914, z = 9},
	{x = 33345, y = 31900, z = 9},
	{x = 33352, y = 31900, z = 9},
	{x = 33355, y = 31854, z = 9},
	{x = 33355, y = 31861, z = 9},
	{x = 33355, y = 31885, z = 9},
	{x = 33345, y = 31864, z = 9},
	{x = 33345, y = 31881, z = 9},
	{x = 33309, y = 31867, z = 9},
	{x = 33317, y = 31879, z = 9},
	{x = 33311, y = 31854, z = 9},
	{x = 33334, y = 31889, z = 9},
	{x = 33340, y = 31890, z = 9},
	{x = 33347, y = 31889, z = 9},
}

local function fillWithFungus(fromPos, toPos)
	for x = fromPos.x, toPos.x do
		for y = fromPos.y, toPos.y do
			if(getTileItemById({x = x, y = y, z = 9}, 13590).uid > 1) then
				doTransformItem(getTileItemById({x = x, y = y, z = 9}, 13590).uid, math.random(13585, 13589))
				doSendMagicEffect({x = x, y = y, z = 9}, CONST_ME_YELLOW_RINGS)
			end
		end
	end
	return true
end

function onKill(cid, target)
	if(isInArray({"iron servant", "golden servant", "diamond servant"}, string.lower(getCreatureName(target)))) then	
		if(getGlobalStorageValue(985) == #pos and getGlobalStorageValue(984) < 25) then
			setGlobalStorageValue(985, 0)
			setGlobalStorageValue(984, getGlobalStorageValue(984) + 1)
			for i = 1, #pos do
				addEvent(doSummonCrature, 5 * 1000, creatures[math.random(1, 3)], pos[i])
				addEvent(doSendMagicEffect, 5 * 1000, pos[i], CONST_ME_TELEPORT)
			end
		elseif(getGlobalStorageValue(985) < #pos and getGlobalStorageValue(984) < 25) then
			setGlobalStorageValue(985, getGlobalStorageValue(985) + 1)
		elseif(getGlobalStorageValue(985) == #pos and getGlobalStorageValue(984) == 25) then
			doSummonCreature("mad mage", magePos[math.random(1, 3)])
			doCreatureSay(target, "The Mad Mage has been spawned!", TALKTYPE_ORANGE_1)
			fillWithFungus({x = 33306, y = 31847}, {x = 33369, y = 31919})
		end
	end
	return true
end