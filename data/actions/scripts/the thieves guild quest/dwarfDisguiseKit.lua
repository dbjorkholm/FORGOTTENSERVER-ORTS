local condition = Condition(CONDITION_OUTFIT)
condition:setTicks(5 * 60 * 1000) -- should be 5 minutes
condition:setOutfit({lookType = 66}) -- dwarf geomancer looktype

function onUse(cid, item, fromPosition, itemEx, toPosition)
	Player(cid):addCondition(condition)
	Item(item.uid):remove()
	return true
end
