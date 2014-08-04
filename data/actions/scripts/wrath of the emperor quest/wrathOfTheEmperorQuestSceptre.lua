function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3181) then
		if(getPlayerItemCount(cid, 12324) >= 1 and getPlayerItemCount(cid, 12325) >= 1 and getPlayerItemCount(cid, 12326) >= 1 and getPlayerStorageValue(cid, Storage.wrathOfTheEmperorQuest) == 10) then
			doPlayerRemoveItem(cid, 12324, 1)
			doPlayerRemoveItem(cid, 12325, 1)
			doPlayerRemoveItem(cid, 12326, 1)
			doPlayerAddItem(cid, 12327, 1)
			doSendMagicEffect(getPlayerPosition(cid), CONST_ME_HOLYAREA)
			setPlayerStorageValue(cid, Storage.wrathOfTheEmperorQuest, 11)
		end
	end
	return true
end
