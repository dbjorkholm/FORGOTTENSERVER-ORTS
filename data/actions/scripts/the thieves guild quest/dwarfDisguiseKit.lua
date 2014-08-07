function onUse(cid, item, fromPosition, itemEx, toPosition)
	local condition = Condition(CONDITION_OUTFIT)
	condition:setTicks(5 * 60 * 2000) -- should be 5 minutes
	condition:addOutfit({lookType = 69}) -- dwarf looktype

	Player(cid):addCondition(condition)
	
	return true
end
