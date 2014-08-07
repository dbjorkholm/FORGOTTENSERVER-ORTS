function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if itemEx.actionid == 12503 then
		if player:getStorageValue(Storage.thievesGuild.Mission02) == 1 then
			player:addItem(8760, 1)
			player:setStorageValue(Storage.thievesGuild.Mission02, 2)
		end
	else
		return false
	end
	return true
end
