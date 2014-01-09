function onUse(cid, item, fromPosition, itemEx, toPosition)

	if(getPlayerStorageValue(cid, 66) > 0) then
		outfit = getPlayerSex(cid) == 0 and 269 or 268
		text = "Nightmare"
	elseif(getPlayerStorageValue(cid, 67) > 0) then
		outfit = getPlayerSex(cid) == 0 and 279 or 278
		text = "Brotherhood"
	else
		return true
	end

	if(item.itemid == 7844) then
		if(canPlayerWearOutfit(cid, outfit, 0)) then
			doPlayerAddOutfit(cid, outfit, 0)
			doRemoveItem(item.uid, 1)
			doSendMagicEffect(getPlayerPosition(cid), CONST_ME_MAGIC_BLUE)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You recive " .. text .. " outfit.")
		end
	elseif(item.itemid == 7845) then
		if(canPlayerWearOutfit(cid, outfit, 1)) then
			if(getPlayerStorageValue(cid, 66) == 2 or getPlayerStorageValue(cid, 67) == 2) then
				doPlayerAddOutfit(cid, outfit, 1)
				doRemoveItem(item.uid, 1)
				doSendMagicEffect(getPlayerPosition(cid), CONST_ME_MAGIC_BLUE)
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You recive " .. text .. " outfit's first addon.")
			end
		end
	elseif(item.itemid == 7846) then
		if(canPlayerWearOutfit(cid, outfit, 2)) then
			if(getPlayerStorageValue(cid, 66) == 3 or getPlayerStorageValue(cid, 67) == 3) then
				doPlayerAddOutfit(cid, outfit, 2)
				doRemoveItem(item.uid, 1)
				doSendMagicEffect(getPlayerPosition(cid), CONST_ME_MAGIC_BLUE)
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You recive " .. text .. " outfit's second addon.")
			end
		end
	end
	return true
end