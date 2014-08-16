function onUse(cid, item, fromPosition, itemEx, toPosition)
	local targetMonster = Monster(itemEx.uid)
	if not targetMonster then
		return true
	end

	local player = Player(cid)
	if player:getStorageValue(946) < 4 and player:getStorageValue(cid, 945) == 1 and targetMonster:getName():lower() == 'damaged crystal golem' then
		player:setStorageValue(946, player:getStorageValue(946) + 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The golem has been returned to the gnomish workshop.')
		targetMonster:remove()
		toPosition:sendMagicEffect(CONST_ME_POFF)
	end

	return true
end