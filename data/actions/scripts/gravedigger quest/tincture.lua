function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.actionid == 4635 then
		local player = Player(cid)
		if player:getStorageValue(9963) == 1 and player:getStorageValue(9964) < 1 then
			player:setStorageValue(9964,1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You crash the vial and spill the blood tincture. This altar is anointed.')
			Item(item.uid):remove()
		end
	end
	return true
end