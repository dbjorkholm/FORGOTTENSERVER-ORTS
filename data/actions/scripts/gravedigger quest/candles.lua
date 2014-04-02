function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.actionid == 4640 then
		local player = Player(cid)
		if player:getStorageValue(9971) == 1 and player:getStorageValue(9972) < 1 then
			player:setStorageValue(9972, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Reading the parchment, you identify three human tallow candles and pocket them.')
			player:addItem(21248, 3)
			Item(item.uid):remove(1)
		end
	end
	return true
end