function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if itemEx.itemid ~= 18341 then
		return false
	end

	local mushroomCount = player:getStorageValue(Storage.BigfootBurden.MushroomCount)
	if mushroomCount == 3 or player:getStorageValue(Storage.BigfootBurden.MissionMushroomDigger) ~= 1 then
		return false
	end

	player:setStorageValue(Storage.BigfootBurden.MushroomCount, mushroomCount + 1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The little pig happily eats the truffles.')
	Item(itemEx.uid):transform(18340)
	toPosition:sendMagicEffect(CONST_ME_GROUNDSHAKER)
	return true
end
