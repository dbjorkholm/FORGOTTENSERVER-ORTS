function onUse(cid, item, fromPosition, itemEx, toPosition) 
	local player = Player(cid)
	player:addPremiumDays(30)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have received 30 premium days.")
	Item(item.uid):remove(1)
	return true
end
