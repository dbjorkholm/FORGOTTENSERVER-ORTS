function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if itemEx.actionid == 4634 then
		if player:getStorageValue(Storage.GravediggerOfDrefia.Mission19) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission20) < 1 then
			player:setStorageValue(Storage.GravediggerOfDrefia.Mission20, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The flames roar and eat the bone hungrily. The Dark Lord is satisfied with your gift')
			Item(item.uid):remove()
		end
	end
	return true
end