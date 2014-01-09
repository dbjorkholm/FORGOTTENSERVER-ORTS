function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 7242) then
		if(itemEx.uid == 3015 and getPlayerStorageValue(cid, 90) == 54) then
			setPlayerStorageValue(cid, 90, 55)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
		elseif(itemEx.uid == 3016 and getPlayerStorageValue(cid, 90) == 55) then
			setPlayerStorageValue(cid, 90, 56)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
		end
	end
	return true
end