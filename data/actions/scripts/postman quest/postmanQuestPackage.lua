function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3120) then
		if(getPlayerStorageValue(cid, 250) == 39) then
			if(getPlayerFreeCap(cid) >= 500) then
				setPlayerStorageValue(cid, 250, 40)
				doPlayerAddItem(cid, 2330, 1)
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a letterbag.")
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You don't have enought capacity. The letterbag weights 500 oz.")
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.itemid == 2330) then
		if(itemEx.actionid == 101 and itemEx.itemid == 2334) then
			if(getPlayerStorageValue(cid, 250) == 40) then
				setPlayerStorageValue(cid, 250, 41)
				doSendMagicEffect(toPosition, CONST_ME_MAGIC_GREEN)
				doTransformItem(item.uid, 1993)
			end
		end
	end
	return true
end