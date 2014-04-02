function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(9935) == 1 and player:getStorageValue(9936) < 1 then
		player:setStorageValue(9936, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You now look like a Necromancer.')
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:removeItem(21464, 1)
	end
	return true
end