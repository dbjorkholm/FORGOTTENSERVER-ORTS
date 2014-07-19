function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	
	if item.actionid == 50091 then
		if player:getStorageValue(Storage.hiddenCityOfBeregar.OreWagon) ~= 1 then
			player:setStorageValue(Storage.hiddenCityOfBeregar.OreWagon, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found the entrance to the hidden city of Beregar and may now use the ore wagon.")
		end
	end
return true
end
