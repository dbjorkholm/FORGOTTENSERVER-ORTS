local players_pos =  {
	{x = 33272, y = 31831, z = 12, stackpos = STACKPOS_TOP_CREATURE},
	{x = 33263, y = 31831, z = 12, stackpos = STACKPOS_TOP_CREATURE},
	{x = 33263, y = 31840, z = 12, stackpos = STACKPOS_TOP_CREATURE},
	{x = 33272, y = 31840, z = 12, stackpos = STACKPOS_TOP_CREATURE}
}

local walls_NS = -- walls positions
	{
	{x=33266, y=31828, z=12, stackpos=1},
	{x=33267, y=31828, z=12, stackpos=1},
	{x=33268, y=31828, z=12, stackpos=1},
	{x=33269, y=31828, z=12, stackpos=1},
	{x=33270, y=31828, z=12, stackpos=1},
	{x=33266, y=31843, z=12, stackpos=1},
	{x=33267, y=31843, z=12, stackpos=1},
	{x=33268, y=31843, z=12, stackpos=1},
	{x=33269, y=31843, z=12, stackpos=1},
	{x=33270, y=31843, z=12, stackpos=1}
}

local levers_pos = -- lever positions
	{
	{x=33273, y=31831, z=12},
	{x=33262, y=31831, z=12},
	{x=33273, y=31840, z=12},
	{x=33262, y=31840, z=12}
}
	
local walls_WE = -- walls positions
	{
	{x=33260, y=31834, z=12, stackpos=1},
	{x=33260, y=31835, z=12, stackpos=1},
	{x=33260, y=31836, z=12, stackpos=1},
	{x=33260, y=31837, z=12, stackpos=1},
	{x=33260, y=31838, z=12, stackpos=1},
	{x=33275, y=31834, z=12, stackpos=1},
	{x=33275, y=31835, z=12, stackpos=1},
	{x=33275, y=31836, z=12, stackpos=1},
	{x=33275, y=31837, z=12, stackpos=1},
	{x=33275, y=31838, z=12, stackpos=1},
}
	
local effects = {
	{x=33261, y=31829, z=12}, {x=33262, y=31830, z=12}, {x=33263, y=31831, z=12},
	{x=33264, y=31832, z=12}, {x=33265, y=31833, z=12}, {x=33266, y=31834, z=12},
	{x=33267, y=31835, z=12}, {x=33268, y=31836, z=12}, {x=33269, y=31837, z=12},
	{x=33270, y=31838, z=12}, {x=33271, y=31839, z=12}, {x=33272, y=31840, z=12},
	{x=33273, y=31841, z=12}, {x=33274, y=31842, z=12}, {x=33274, y=31829, z=12},
	{x=33273, y=31830, z=12}, {x=33272, y=31831, z=12}, {x=33271, y=31832, z=12},
	{x=33270, y=31833, z=12}, {x=33269, y=31834, z=12}, {x=33268, y=31835, z=12},
	{x=33267, y=31836, z=12}, {x=33266, y=31837, z=12}, {x=33265, y=31838, z=12},
	{x=33264, y=31839, z=12}, {x=33263, y=31840, z=12}, {x=33262, y=31841, z=12},
	{x=33261, y=31842, z=12}
}

local room = {
    	fromX = 33260,
	fromY = 31828,
	fromZ = 12,
	--------------
   	toX = 33275,
    	toY = 31843,
	toZ = 12
}

local function kick(cid)
	if (isPlayer(cid)) then
		if (isInRange(getThingPos(cid), {x=33238, y=31806, z=12}, {x=33297, y=31865, z=12})) then
			doTeleportThing(cid, {x=33265, y=31838, z=10})
			doSendMagicEffect({x=33265, y=31838, z=10}, CONST_ME_TELEPORT)
		end
	end
	return true
end

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

local function warn(cid)
	if (isPlayer(cid)) then
		doCreatureSay(cid, 'You have 5 minutes from now on until you get teleported out.', TALKTYPE_ORANGE_2, false, 0, {x=33266, y=31835, z=13})
	end
	return true
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = {}
	local failed = true
	if (item.itemid == 1945) then
		if (getTopCreature({x = 33272, y = 31831, z = 12, stackpos = STACKPOS_TOP_CREATURE}).itemid > 0 and getTopCreature({x = 33263, y = 31831, z = 12, stackpos = STACKPOS_TOP_CREATURE}).itemid > 0 and getGlobalStorageValue(10005) > 0 and getGlobalStorageValue(10006) > 0 and getGlobalStorageValue(10007) > 0 and getGlobalStorageValue(10008) > 0) then
			failed = false
		else
			doCreatureSay(cid, 'Charge the four machines and stand at the marked spots beside the levers.', TALKTYPE_ORANGE_1, false, cid, getThingPos(cid))
			failed = true
			return true
		end
		local lever1 = getTileItemById({x=33273, y=31831, z=12}, 1946).uid
		local lever2 = getTileItemById({x=33262, y=31831, z=12}, 1946).uid
		local lever3 = getTileItemById({x=33273, y=31840, z=12}, 1946).uid
		local lever4 = getTileItemById({x=33262, y=31840, z=12}, 1946).uid
		if (lever1 > 0 and lever2 > 0 and lever3 > 0) or (lever1 > 0 and lever2 > 0 and lever4 > 0) or (lever1 > 0 and lever3 > 0 and lever4 > 0) or (lever2 > 0 and lever3 > 0 and lever4 > 0) then
			failed = false
		else
			doTransformItem(item.uid, 1946)
			doCreatureSay(cid, 'Everyone have to use the switches!', TALKTYPE_ORANGE_1, false, cid, getThingPos(cid))
			failed = true
			return true
		end
		if (failed == false) then
			doSummonCreature('Lord of the Elements', {x=33267, y=31836, z=12})
			addEvent(reset, 10 * 60 * 1000)
			addEvent(warn, 5 * 60 * 1000, cid)
			doCreatureSay(cid, 'You have 10 minutes from now on until you get teleported out.', TALKTYPE_ORANGE_2, false, 0, {x=33266, y=31835, z=13})
			setGlobalStorageValue(10004, 1)
			doCreatureSay(cid, 'ZOOOOOOOOM', TALKTYPE_ORANGE_1, false, 0, {x=33268, y=31828, z=12})
			doCreatureSay(cid, 'ZOOOOOOOOM', TALKTYPE_ORANGE_1, false, 0, {x=33268, y=31843, z=12})
			doCreatureSay(cid, 'ZOOOOOOOOM', TALKTYPE_ORANGE_1, false, 0, {x=33260, y=31836, z=12})
			doCreatureSay(cid, 'ZOOOOOOOOM', TALKTYPE_ORANGE_1, false, 0, {x=33275, y=31836, z=12})
			doTransformItem(item.uid, 1946)
			for i = 1, 4 do
				player[i] = getThingfromPos(players_pos[i])
				if (player[i].itemid > 0) then
					if (isPlayer(player[i].uid) == TRUE) then
						addEvent(kick, 10 * 60 * 1000, cid)
					end
				end
			end		
			for i = 1, #walls_NS do
				local wns = getTileItemById(walls_NS[i], 8861).uid
				if (wns == 0) then
					doCreateItem(8861, 1, walls_NS[i])
				end
			end
			for i = 1, #walls_WE do
				local wwe = getTileItemById(walls_WE[i], 8862).uid
				if (wwe == 0) then
					doCreateItem(8862, 1, walls_WE[i])
				end
			end
			for _, v in ipairs(effects) do
				doSendMagicEffect(v, CONST_ME_ENERGYHIT)
			end	
		end
	end
	return true
end