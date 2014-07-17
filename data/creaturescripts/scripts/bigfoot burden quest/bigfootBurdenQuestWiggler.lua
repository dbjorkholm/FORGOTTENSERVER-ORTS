function onKill(cid, target)
	target = Creature(target)
	local player = Player(cid)
	if string.lower(target:getName()) == "wiggler" then
		if player:getStorageValue(937) < 7 and player:getStorageValue(936) == 1 then
			player:setStorageValue(937, player:getStorageValue(937) + 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You killed " .. player:getStorageValue(937) .. " of 10 wigglers.")
		end
	end
	return true
end