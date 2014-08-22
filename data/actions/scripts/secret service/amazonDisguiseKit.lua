local condition = Condition(CONDITION_OUTFIT)
condition:setTicks(20 * 1000) -- should be approximately 20 seconds
condition:addOutfit({lookType = 137}) -- amazon looktype

function onUse(cid, item, fromPosition, itemEx, toPosition)

	Player(cid):addCondition(condition)

	return true
end
