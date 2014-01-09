local Area_fromPos, Area_toPos = {x = 33235, y = 31801, z = 12}, {x = 33299, y = 31867, z = 12}

local t = {
	[1] = {{x=33268, y=31833, z=10}, 8304, {x=33268, y=31833, z=12}},
	[2] = {{x=33268, y=31838, z=10}, 8305, {x=33267, y=31838, z=12}},
	[3] = {{x=33270, y=31835, z=10}, 8300, {x=33270, y=31835, z=12}},
	[4] = {{x=33266, y=31835, z=10}, 8306, {x=33265, y=31835, z=12}}
}

local function reset()
	for i = 1, #walls_NS do
		local wns = getTileItemById(walls_NS[i], 8861).uid
		if (wns ~= 0) then
			doRemoveItem(wns)
		end
	end
	for i = 1, #walls_WE do
		local wwe = getTileItemById(walls_WE[i], 8862).uid
		if (wwe ~= 0) then
			doRemoveItem(wwe)
		end
	end
	for i = 1, 4 do
		local lever = getTileItemById(levers_pos[i], 1946).uid
		if (lever > 0) then
			doTransformItem(lever, 1945)
		end
	end
	for _x = room.fromX, room.toX do
		for _y = room.fromY, room.toY do
			for _z = room.fromZ, room.toZ do
				creature = getTopCreature({x = _x, y = _y, z = _z})
				if (creature.type == THING_TYPE_MONSTER and getCreatureName(creature.uid) == 'Lord of the Elements') then
					doRemoveCreature(creature.uid)
				end
			end
		end
	end
	setGlobalStorageValue(10004, 0)
	setGlobalStorageValue(10005, 0)
	setGlobalStorageValue(10006, 0)
	setGlobalStorageValue(10007, 0)
	setGlobalStorageValue(10008, 0)
	return true
end
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (item.itemid == 1945) then
		if (isPlayerInArea(Area_fromPos, Area_toPos) or getGlobalStorageValue(10004) > 0) then
			return (doCreatureSay(cid, 'Wait for the current team to exit.', TALKTYPE_ORANGE_1, false, 0, {x=33268, y=31835, z=10}))
		end
		for k, v in pairs(t) do
			local player = getTopCreature(v[1]).uid
			if isPlayer(player) == FALSE then
				return (doCreatureSay(cid, 'You need one player of each vocation having completed the Elemental Spheres quest and also carrying the elemental rare item.', TALKTYPE_ORANGE_1, false, 0, {x=33268, y=31835, z=10}))
			end
			local voc = getPlayerVocation(player)
			if voc > 4 then
				voc = voc - 4
			end
			if voc ~= k or getPlayerItemCount(player, v[2]) < 1 or getPlayerStorageValue(player, 10000) < 2 then
				return (doCreatureSay(cid, 'You need one player of each vocation having completed the Elemental Spheres quest and also carrying the elemental rare item.', TALKTYPE_ORANGE_1, false, 0, {x=33268, y=31835, z=10}))
			end
		end
		local effectTable = {}
		for k, v in pairs(t) do
			local player = getTopCreature(v[1]).uid
			doTeleportThing(player, v[3])
			doSendMagicEffect(v[1], CONST_ME_TELEPORT)
			table.insert(effectTable, v[3])
			doTransformItem(item.uid, 1946)
		end
		for _, v in ipairs(effectTable) do
			doSendMagicEffect(v, CONST_ME_TELEPORT)
			v = nil
		end
	elseif (item.itemid == 1946) then
		doTransformItem(item.uid, 1945)
	end
	return true
end