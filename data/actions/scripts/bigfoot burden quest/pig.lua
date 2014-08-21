function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid ~= 18341 then
		return false
	end

	local player = Player(cid)
	if player:getStorageValue(940) == 3 or player:getStorageValue(939) ~= 1 then
		return false
	end

	player:setStorageValue(940, player:getStorageValue(940) + 1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The little pig happily eats the truffles.')
	Item(itemEx.uid):transform(18340)
	toPosition:sendMagicEffect(CONST_ME_GROUNDSHAKER)
	return true
end
