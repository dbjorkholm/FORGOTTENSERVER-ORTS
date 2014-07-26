local function doSummonMinions()
	if getGlobalStorageValue(3147) == 1 then
		for i = 1, 6 do
			local pos = {x = math.random(33066, 33086), y = math.random(31870, 31887), z = 12}
			Game.createMonster("vesperoth minion", pos)
			pos:sendMagicEffect(CONST_ME_TELEPORT)
		end
	else
		return true
	end
	return addEvent(doSummonMinions, 20 * 1000)
end

local function vesperothHide()
	if Game.getStorageValue(3147) == 1 then
		local chance = math.random(10)
		if chance == 1 then
			local vesperoth = Creature(getThingfromPos({x = 33075, y = 31878, z = 12, stackpos = 255}).uid)
			Game.setStorageValue(3148, vesperoth:getHealth())
			vesperoth:teleportTo(Position(33098, 31870, 12))
			Game.createItem(18462, 1, Position(33098, 31870, 12))
			addEvent(Tile(Position(33075, 37878, 12)):getItemById(18462):remove(), 6 * 1000, 1)
			addEvent(vesperoth:teleportTo(), 6 * 1000 + 50, Position(33075, 37878, 12))
			return addEvent(vesperothHide, 6 * 1000)
		end
	else
		return true
	end
	return addEvent(vesperothHide, 4 * 1000)
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 18463 then
		if Game.getStorageValue(3147) < 1 then
			Game.setStorageValue(3147, 1)
			doSummonMinions()
			vesperothHide()
		end
	end
	return true
end