function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 18313 and itemEx.itemid == 18321) then
		chance = math.random(1, 3)
		if(getPlayerStorageValue(cid, 943) < 1 and getPlayerStorageValue(cid, 942) == 1) then
			if(chance == 3) then
				setPlayerStorageValue(cid, 943, getPlayerStorageValue(cid, 943) + 1)
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Congratulations! The crystals seem to have fallen in love and your mission is done!")
				doTransformItem(item.uid, 18312)
			else
				doSendMagicEffect(toPosition, CONST_ME_POFF)
			end
			doTransformItem(itemEx.uid, 18320)
			addEvent(doTransformItem, 40 * 1000, itemEx.uid, 18321)
		end
	end
	return true
end