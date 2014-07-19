function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)

	if player:getStorageValue(Storage.hiddenCityOfBeregar.JusticeForAll) == 4 then
		player:addItem(14348, 1)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found Rerun's ring.")
		player:setStorageValue(Storage.hiddenCityOfBeregar.JusticeForAll, 5)
	end
	return true
end
