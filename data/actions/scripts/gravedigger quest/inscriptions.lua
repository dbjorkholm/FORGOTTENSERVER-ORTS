function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(9921) == 1 and player:getStorageValue(9922) < 1 then
		player:setStorageValue(9922, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The words seem to breathe, stangely. One word stays in your mind: bronze')
		player:getPosition():sendMagicEffect(CONST_ME_ENERGYHIT)
	elseif player:getStorageValue(9922) == 1 and player:getStorageValue(9923) < 1 then
		player:setStorageValue(9923, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The words seem to glow slightly. A name fixes in your mind: Takesha Antishu')
		player:getPosition():sendMagicEffect(CONST_ME_ENERGYHIT)
	elseif player:getStorageValue(9923) == 1 and player:getStorageValue(9924) < 1 then
		player:setStorageValue(9924, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The words seem to flutter. One word stays in your mind: floating')
		player:getPosition():sendMagicEffect(CONST_ME_ENERGYHIT)
	end
	return true
end