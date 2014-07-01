local cursed = Condition(CONDITION_CURSED)
cursed:setParameter(CONDITION_PARAM_DELAYED, true) -- Condition will delay the first damage from when it's added
cursed:setParameter(CONDITION_PARAM_MINVALUE, -800) -- Minimum damage the condition can do at total
cursed:setParameter(CONDITION_PARAM_MAXVALUE, -1200) -- Maximum damage
cursed:setParameter(CONDITION_PARAM_STARTVALUE, -1) -- The damage the condition will do on the first hit
cursed:setParameter(CONDITION_PARAM_TICKINTERVAL, 4000) -- Delay between damages
cursed:setParameter(CONDITION_PARAM_FORCEUPDATE, true) -- Re-update condition when adding it(ie. min/max value)

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local depleteChance = 05
	local player = Player(cid)
	local targetItem = Item(item.uid)
	if math.random(100) <= depleteChance then
		player:addCondition(cursed)
		targetItem:transform(10312)
		targetItem:decay()
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Ouch! The serpent claw stabbed you.')
	else
		if player:getCondition(CONDITION_POISON) then
			player:removeCondition(CONDITION_POISON)
		end
		targetItem:transform(10311)
		targetItem:decay()
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	end
	return true
end
