function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.actionid == 4632 then
		local player = Player(cid)
		if player:getStorageValue(9954) == 1 and player:getStorageValue(9955) < 1 then
			player:setStorageValue(9955, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The dragon tears glow and disappear. The old powers are appeased.')
			Item(item.uid):remove(3)
		end
	end
	return true
end