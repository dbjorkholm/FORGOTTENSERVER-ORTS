function onUse(cid, item, fromPosition, itemEx, toPosition)
	pos = {x = getPlayerPosition(cid).x, y = getPlayerPosition(cid).y - 5, z = 10}
	if(item.itemid == 18225) then
		if(getPlayerStorageValue(cid, 902) < 6) then
			if(getTileItemById(pos, 18226).uid > 0) then
				setPlayerStorageValue(cid, 902, getPlayerStorageValue(cid, 902) + 1)
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Hit!")
				doRemoveItem(getTileItemById(pos, 18226).uid, 1)
				doSendMagicEffect(pos, CONST_ME_FIREATTACK)
				for i = 2, 4 do
					effectPos = {x = getPlayerPosition(cid).x, y = getPlayerPosition(cid).y - i, z = 10}
					doSendMagicEffect(effectPos, CONST_ME_TELEPORT)
				end	
			elseif(getTileItemById(pos, 18227).uid > 0) then
				setPlayerStorageValue(cid, 902, getPlayerStorageValue(cid, 902) < 1 and 0 or getPlayerStorageValue(cid, 902) - 1)
				doRemoveItem(getTileItemById(pos, 18227).uid, 1)
				doSendMagicEffect(pos, CONST_ME_FIREATTACK)
				for i = 2, 4 do
					effectPos = {x = getPlayerPosition(cid).x, y = getPlayerPosition(cid).y - i, z = 10}
					doSendMagicEffect(effectPos, CONST_ME_TELEPORT)
				end	
			end
		end	
	end
	return true
end