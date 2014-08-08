function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	local fail = math.random(100)
	if itemEx.actionid == 12503 then
		if fail <= 15 then
			if player:getStorageValue(Storage.thievesGuild.Mission02) == 1 then
				player:addItem(8760, 1)
				player:setStorageValue(Storage.thievesGuild.Mission02, 2)
			end
		elseif fail > 15 then
			player:removeItem(8717, 1)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "Your lock pick broke.")
		else
			return false
		end
	end
	return true
end
