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

local creatures = {
	"iron servant",
	"golden servant",
	"diamond servant"
}

local function getFungusInArea(fromPos, toPos)
	for x = fromPos.x, toPos.x do
		for y = fromPos.y, toPos.y do
			for i = 13585, 13589 do
				if(getTileItemById({x = x, y = y, z = 9}, i).uid > 1) then
					return true
				end
			end
		end
	end
	return false
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 13601) then
		if(isInArray({13585, 13586, 13587, 13588, 13589}, itemEx.itemid)) then
			if(getPlayerStorageValue(cid, 984) + 15 * 1000 < os.time()) then
				doTransformItem(itemEx.uid, 13590, 1)
				setPlayerStorageValue(cid, 984, os.time())
				doSendMagicEffect(toPosition, CONST_ME_POFF)
				if(getFungusInArea({x = 33306, y = 31847}, {x = 33369, y = 31919}) == false) then
					for i = 1, #pos do
						addEvent(doSummonCrature, 5 * 1000, creatures[math.random(3)], pos[i])
						addEvent(doSendMagicEffect, 5 * 1000, pos[i], CONST_ME_TELEPORT)
					end
					doSendMagicEffect(getPlayerPosition(cid), CONST_ME_FIREWORK_RED)
					doCreatureSay(cid, "COME! My servants! RISE!", TALKTYPE_MONSTER_SAY)
					setGlobalStorageValue(985, 0)
					setGlobalStorageValue(984, 0)
				else
					doCreatureSay(cid, "The slime gobbler gobbles large chunks of the slime fungus with great satisfaction.", TALKTYPE_MONSTER_SAY)
					doPlayerAddExp(cid, 20, true, true)
				end
			end
		end
	end
	return true
end