function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3162) then
		if(getPlayerStorageValue(cid, 1050) == 1) then
			setPlayerStorageValue(cid, 1050, 2)
			doPlayerAddItem(cid, 11101, 1)
			doCreatureSay(cid, "A batch of documents has been stashed in the shelf. These might be of interest to Zalamon.", TALKTYPE_ORANGE_1)
			doSendMagicEffect(toPosition, CONST_ME_POFF)
		end
	end
	return true
end