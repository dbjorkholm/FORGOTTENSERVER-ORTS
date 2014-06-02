function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if(item.uid == 3067) then
		if(player:getStorageValue(388) < 1) then
			player:setStorageValue(388, 1)
			player:addItem(7730, 1)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found blue legs.")
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 3068) then
		if(player:getStorageValue(389) < 1) then
			player:setStorageValue(389, 1)
			player:addMoney(5000)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You've found 5000 gold pieces.")
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end