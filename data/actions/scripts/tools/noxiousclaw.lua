function onUse(cid, item, fromPosition, itemEx, toPosition)
	local depleteChance = 01
	local player = Player(cid)
	local targetItem = Item(item.uid)
	if math.random(100) <= depleteChance then
		player:addCondition(CONDITION_CURSED)
		targetItem:transform(10312)
		targetItem:decay()
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
	else
		if player:getCondition(CONDITION_POISON) then
			player:removeCondition(CONDITION_POISON)
		end
		targetItem:transform(10311)
		targetItem:decay()
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
		depleteChance = depleteChance + 1
	end
	return true
end
