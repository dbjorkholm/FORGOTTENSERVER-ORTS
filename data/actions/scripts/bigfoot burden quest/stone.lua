function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(952) == 1 or player:getStorageValue(951) ~= 1 then
		return false
	end

	toPosition:sendMagicEffect(CONST_ME_HITBYFIRE)
	doTransformItem(item.uid, 18335)
	
	if math.random(15) ~= 15 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You had no luck this time.')
		return true
	end

	player:setStorageValue(952, 1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Your skill allowed you to grab a whetstone before the stone sinks into lava.')
	player:addItem(18337, 1)
	return true
end
