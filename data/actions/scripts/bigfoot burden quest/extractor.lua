function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid ~= 18484 then
		return false
	end

	local player = Player(cid)
	if player:getStorageValue(934) == 7 or player:getStorageValue(933) ~= 1 then
		return false
	end

	player:setStorageValue(934, player:getStorageValue(934) + 1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You gathered a spark.')
	Item(itemEx.uid):transform(18485)
	toPosition:sendMagicEffect(CONST_ME_ENERGYHIT)
	return true
end
