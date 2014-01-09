function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3017) then
		if(getPlayerStorageValue(cid, 90) == 57) then
			setPlayerStorageValue(cid, 90, 58)
			doCreateItem(7314, 1,getPlayerPosition(cid))
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
		end
	end
	return true
end