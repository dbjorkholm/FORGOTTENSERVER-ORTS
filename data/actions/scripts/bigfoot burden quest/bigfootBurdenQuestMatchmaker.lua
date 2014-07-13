function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if(item.itemid == 18313 and itemEx.itemid == 18321) then
		chance = math.random(3)
		if(player:getStorageValue(943) < 1 and player:getStorageValue(942) == 1) then
			if(chance == 3) then
				player:setStorageValue(943, player:getStorageValue(943) + 1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations! The crystals seem to have fallen in love and your mission is done!")
				Item(item.uid):transform(18312)
			else
				toPosition:sendMagicEffect(CONST_ME_POFF)
			end
			Item(itemEx.uid):transform(18320)
			addEvent(doTransformItem, 40 * 1000, itemEx.uid, 18321)
		end
	end
	return true
end