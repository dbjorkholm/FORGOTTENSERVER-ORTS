function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	player:addPremiumDays(30)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have received 30 premium days.")
	Item(item.uid):remove(1)
	return true
end
