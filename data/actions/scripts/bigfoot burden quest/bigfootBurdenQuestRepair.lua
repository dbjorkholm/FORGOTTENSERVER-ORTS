function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if item.itemid == 18343 and isMonster(itemEx.uid) then
		if player:getStorageValue(946) < 4 and player:getStorageValue(945) == 1 and string.lower(Creature(itemEx.uid):getName()) == "damaged crystal golem" then
			player:setStorageValue(946, player:getStorageValue(946) + 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The golem has been returned to the gnomish workshop.")
			Creature(itemEx.uid):remove()
			toPosition:sendMagicEffect(CONST_ME_POFF)
		end
	end
	return true
end