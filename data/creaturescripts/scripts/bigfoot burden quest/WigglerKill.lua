function onKill(cid, target)
	local targetMonster = Monster(target)
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'wiggler' then
		return true
	end

	local player = Player(cid)
	local value = player:getStorageValue(937)
	if value < 7 and player:getStorageValue(936) == 1 then
		player:setStorageValue(937, value + 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You killed ' .. (value + 1) .. ' of 10 wigglers.')
	end
	return true
end