function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)

	if item.uid == 3116 then
		if player:getStorageValue(Storage.postman.Mission05) == 1 then
			player:setStorageValue(Storage.postman.Mission05, 2)
			player:addItem(2331, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a present.")
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The chest is empty.")
		end
	elseif item.itemid == 2331 then
		player:removeItem(item.uid, 1)
		toPosition:sendMagicEffect(CONST_ME_POFF)
		player:say("You open the present.", TALKTYPE_MONSTER_SAY)
	end
	return true
end
