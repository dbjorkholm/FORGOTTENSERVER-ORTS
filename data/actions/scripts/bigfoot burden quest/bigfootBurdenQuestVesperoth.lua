local function doSummonMinions()
	if(getGlobalStorageValue(3147) == 1) then
		for i = 1, 6 do
			pos = {x = math.random(33066, 33086), y = math.random(31870, 31887), z = 12}
			doSummonCreature("vesperoth minion", pos)
			doSendMagicEffect(pos, CONST_ME_TELEPORT)
		end
	else
		return true
	end
	return addEvent(doSummonMinions, 20 * 1000)
end

local function vesperothHide()
	if(getGlobalStorageValue(3147) == 1) then
		chance = math.random(1, 10)
		if(chance == 1) then
			vesperoth = getThingfromPos({x = 33075, y = 31878, z = 12, stackpos = 255}).uid
			setGlobalStorageValue(3148, getCreatureHealth(vesperoth))
			doTeleportThing(vesperoth, {x = 33098, y = 31870, z = 12})
			doCreateItem(18462, 1, {x = 33075, y = 31878, z = 12})
			addEvent(doRemoveItem, 6 * 1000, getTileItemById({x = 33075, y = 31878, z = 12}, 18462).uid, 1)
			addEvent(doTeleportThing, 6 * 1000 + 50, vesperoth, {x = 33075, y = 31878, z = 12})
			return addEvent(vesperothHide, 6 * 1000)
		end
	else
		return true
	end
	return addEvent(vesperothHide, 4 * 1000)
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 18463) then
		if(getGlobalStorageValue(3147) < 1) then
			setGlobalStorageValue(3147, 1)
			doSummonMinions()
			vesperothHide()
		end
	end
	return true
end