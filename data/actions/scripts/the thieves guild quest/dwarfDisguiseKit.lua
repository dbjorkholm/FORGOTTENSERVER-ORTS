function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	local condition = Condition(CONDITION_OUTFIT)
	condition:setTicks(5 * 60 * 2000) -- should be 5 minutes
	condition:addOutfit({lookType = 69}) -- dwarf looktype

	player:addCondition(condition)
	
	return true
end
