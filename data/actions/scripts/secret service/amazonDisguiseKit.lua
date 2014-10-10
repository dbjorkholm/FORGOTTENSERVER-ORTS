local condition = Condition(CONDITION_OUTFIT)
condition:setTicks(20 * 1000) -- should be approximately 20 seconds
condition:setOutfit({lookType = 137, lookHead = 113, lookBody = 120, lookLegs = 114, lookFeet = 132}) -- amazon looktype

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	player:addCondition(condition)
	player:say('You disguise yourself as a beautiful amazon!', TALKTYPE_MONSTER_SAY)
	Item(item.uid):remove()
	return true
end
