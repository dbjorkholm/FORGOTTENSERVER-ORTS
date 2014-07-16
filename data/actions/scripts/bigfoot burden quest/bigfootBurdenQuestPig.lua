function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if(item.itemid == 18339 and itemEx.itemid == 18341) then
		if(player:getStorageValue(940) < 3 and player:getStorageValue(939) == 1) then
			player:setStorageValue(940, player:getStorageValue(940) + 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The little pig happily eats the truffles.")
			Item(itemEx.uid):transform(18340)
			toPosition:sendMagicEffect(CONST_ME_POFF)
		end
	end
	return true
end