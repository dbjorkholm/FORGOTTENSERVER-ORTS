function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 18343 and isMonster(itemEx.uid)) then
		if(getPlayerStorageValue(cid, 946) < 4 and getPlayerStorageValue(cid, 945) == 1 and string.lower(getCreatureName(itemEx.uid)) == "damaged crystal golem") then
			setPlayerStorageValue(cid, 946, getPlayerStorageValue(cid, 946) + 1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "The golem has been returned to the gnomish workshop.")
			doRemoveCreature(itemEx.uid)
			doSendMagicEffect(toPosition, CONST_ME_POFF)
		end
	end
	return true
end