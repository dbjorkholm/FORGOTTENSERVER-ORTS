local function revertItem(position, itemId, transformId)
	local item = Tile(position):getItemById(itemId)
	if item then
		item:transform(transformId)
	end
end

function onStepIn(cid, item, position, fromPosition)
	local monster = Monster(cid)
	if not monster then
		return true
	end

	if monster:getName():lower() ~= 'the keeper' then
		return true
	end

	doTargetCombatHealth(0, cid, COMBAT_PHYSICALDAMAGE, -6000, -8000, CONST_ME_BIGPLANTS)
	Item(item.uid):transform(12335)
	addEvent(revertItem, math.random(10, 30) * 1000, position, 12335, 12334)
	return true
end
