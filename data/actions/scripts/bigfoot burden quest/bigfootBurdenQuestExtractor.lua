function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if item.itemid == 18213 and itemEx.itemid == 18484 then
		if player:getStorageValue(934) < 7 and player:getStorageValue(933) == 1 then
			player:setStorageValue(934, player:getStorageValue(934) + 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You gathered a spark.")
			Item(itemEx.uid):transform(18485)
			toPosition:sendMagicEffect(CONST_ME_POFF)
		end
	end
	return true
end