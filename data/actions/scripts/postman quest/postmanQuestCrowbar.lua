function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 2415 and itemEx.actionid == 100 and itemEx.itemid == 2593) then
		if(getPlayerStorageValue(cid, 250) == 3) then
			setPlayerStorageValue(cid, 250, 4)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
		end
	end
	return true
end