function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3024) then
		if(getPlayerStorageValue(cid, 82) == 9 and doPlayerRemoveItem(cid, 2344, 1)) then
			setPlayerStorageValue(cid, 82, 10)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
			doPlayerAddItem(cid,2356,1)

		end
	end
	return true
end