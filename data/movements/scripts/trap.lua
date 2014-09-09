local traps = {
	[1510] = {transformTo = 1511, damage = {-50, -100}},
	[1513] = {damage = {-50, -100}},
	[2579] = {transformTo = 2578, damage = {-15, -30}},
	[4208] = {transformTo = 4209, damage = {-15, -30}, type = COMBAT_EARTHDAMAGE}
}

function onStepIn(cid, item, position, fromPosition)
	local trap = traps[item.itemid]
	if not trap then
		return true
	end
	if Monster(cid) then
		doTargetCombatHealth(0, cid, trap.type or COMBAT_PHYSICALDAMAGE, trap.damage[1], trap.damage[2], CONST_ME_NONE)
	end
	if trap.transformTo then
		Item(item.uid):transform(trap.transformTo)
	end
	return true
end

function onStepOut(cid, item, position, fromPosition)
	Item(item.uid):transform(item.itemid - 1)
	return true
end

function onRemoveItem(item, tile, position)
	local trapItem = Item(item.uid)
	local thingPos = trapItem:getPosition()
	if getDistanceBetween(thingPos, position) > 0 then
		trapItem:transform(item.itemid - 1)
		thingPos:sendMagicEffect(CONST_ME_POFF)
	end
	return true
end
