function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if itemEx.actionid == 4632 then
		if player:getStorageValue(Storage.GravediggerOfDrefia.Mission14) == 1 and player:getStorageValue(Storage.GravediggerOfDrefia.Mission15) < 1 then
			player:setStorageValue(Storage.GravediggerOfDrefia.Mission15, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The dragon tears glow and disappear. The old powers are appeased.')
			Item(item.uid):remove(3)
		end
	end
	return true
end