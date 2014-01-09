function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerStorageValue(cid, 10014) < 1) then
		doPlayerAddExp(cid, 1000000, true, true)
		setPlayerStorageValue(cid, 10014, 1)
	end
	if(item.uid == 3200) then
		if(canPlayerWearOutfit(cid, getPlayerSex(cid) == 0 and 366 or 367, 0) == false) then
			doPlayerAddOutfit(cid, getPlayerSex(cid) == 0 and 366 or 367, 0)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found some clothes in wardrobe")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The wardrobe is empty.")
		end
	elseif(item.uid == 3201) then
		if(getPlayerStorageValue(cid, 1091) < 1) then
			setPlayerStorageValue(cid, 1091, 1)
			doPlayerAddItem(cid, 12643, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a royal scale robe.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 3202) then
		if(getPlayerStorageValue(cid, 1092) < 1) then
			setPlayerStorageValue(cid, 1092, 1)
			doPlayerAddItem(cid, 12642, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a royal draken mail.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 3203) then
		if(getPlayerStorageValue(cid, 1093) < 1) then
			setPlayerStorageValue(cid, 1093, 1)
			doPlayerAddItem(cid, 12645, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a elite draken helmet.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 3204) then
		if(getPlayerStorageValue(cid, 1094) < 1) then
			setPlayerStorageValue(cid, 1094, 1)
			doPlayerAddItem(cid, 2152, 100)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found 100 platinum coins.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end	
	elseif(item.uid == 3205) then
		if(getPlayerStorageValue(cid, 1095) < 1) then
			setPlayerStorageValue(cid, 1095, 1)
			bag = doPlayerAddItem(cid, 5801, 1)
			doAddContainerItem(bag.uid, 5882, 10)
			doAddContainerItem(bag.uid, 3258, 1)
			doAddContainerItem(bag.uid, 9971, 5)
			doAddContainerItem(bag.uid, 2144, 10)
			doAddContainerItem(bag.uid, 2160, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a backpack.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end	
	end
	return true
end