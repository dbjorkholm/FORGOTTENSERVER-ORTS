function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3024) then
		if(getPlayerStorageValue(cid, BlueDjinn.MissionStart+3) == 2 and getPlayerItemCount(cid, 2344) > 0) then
			doPlayerRemoveItem(cid, 2344, 1)
			setPlayerStorageValue(cid, BlueDjinn.MissionStart+3, 3)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
			doPlayerAddItem(cid,2356,1)

		end
	end
	return true
end