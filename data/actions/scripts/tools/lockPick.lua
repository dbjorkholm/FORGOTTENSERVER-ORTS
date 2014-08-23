function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if itemEx.actionid ~= 12503 then
		return false
	end

	if math.random(100) <= 15 then
		if player:getStorageValue(Storage.thievesGuild.Mission02) == 1 then
			player:addItem(8760, 1)
			player:setStorageValue(Storage.thievesGuild.Mission02, 2)
		end
	else
		Item(item.uid):remove(1)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Your lock pick broke.")
	end
	return true
end
