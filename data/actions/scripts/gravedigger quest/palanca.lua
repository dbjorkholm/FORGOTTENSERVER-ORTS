function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(9985) == 1 and player:getStorageValue(9986) < 1 then
		player:setStorageValue(9986, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, '<sizzle> <fizz>')
		player:getPosition():sendMagicEffect(CONST_ME_ENERGYHIT)
	end
	return true
end