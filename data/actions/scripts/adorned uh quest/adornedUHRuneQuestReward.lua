function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 2240) then
		local p = Player(cid)
		if(p:getStorageValue(335) < 1) then
			p:setStorageValue(335, 1)
			p:addItem(12559, 1)
			p:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a silver rune emblem.")
		else
			p:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
return true
end
