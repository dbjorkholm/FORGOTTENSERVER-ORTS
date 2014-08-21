function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3080) then
		local player = Player(cid)
		if(player:getStorageValue(Storage.InServiceofYalahar.AlchemistFormula) < 1) then
			player:setStorageValue(Storage.InServiceofYalahar.AlchemistFormula, 1)
			player:addItem(9733, 1)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found an alchemist formula.")
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end