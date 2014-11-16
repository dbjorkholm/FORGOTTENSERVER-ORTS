function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if itemEx.itemid == 2817 then
		if player:getStorageValue(Storage.GravediggerOfDrefia.Mission11) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission12) < 1 then
			player:setStorageValue(Storage.GravediggerOfDrefia.Mission12, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Done! Report back to Omrabas.')
			player:addItem(21403, 1)
			Item(item.uid):remove()
		end
	end
	return true
end