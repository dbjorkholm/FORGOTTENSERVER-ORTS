function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	local repairedCount = player:getStorageValue(Storage.BigfootBurden.RepairedCrystalCount)
	if repairedCount == 5 or player:getStorageValue(Storage.BigfootBurden.MissionCrystalKeeper) ~= 1 then
		return false
	end

	if itemEx.itemid == 18307 then
		player:setStorageValue(Storage.BigfootBurden.RepairedCrystalCount, repairedCount + 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have repaired a damaged crystal.')
		Item(itemEx.uid):transform(18311)
		Item(itemEx.uid):decay()
		toPosition:sendMagicEffect(CONST_ME_ENERGYAREA)
	elseif isInArray({18308, 18309, 18310, 18311}, itemEx.itemid) then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'This is not the crystal you\'re looking for!')
	end
	return true
end
