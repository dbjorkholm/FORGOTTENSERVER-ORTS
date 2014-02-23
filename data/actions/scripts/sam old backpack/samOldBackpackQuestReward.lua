function onUse(cid, item, fromPosition, itemEx, toPosition)
	local p = Player(cid)
	if(item.uid == 9226) then
		if(p:getStorageValue(330) == 2) then
			p:setStorageValue(330, 3)
			p:addItem(2503, 1)
			p:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a dwarven armor.")
		else
			p:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
return true
end
