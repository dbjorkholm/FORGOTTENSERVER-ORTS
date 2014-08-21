local config = {
	[18328] = 18221,
	[18329] = 18222,
	[18330] = 18223,
	[18331] = 18224
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local spores = config[item.itemid]
	if not spores then
		return true
	end

	local player = Player(cid)
	if player:getStorageValue(949) == 4 or player:getStorageValue(948) ~= 1 then
		return false
	end

	if itemEx.itemid ~= spores then
		player:setStorageValue(949, 0)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have gathered the wrong spores. You ruined your collection.')
		Item(item.uid):transform(18328)
		toPosition:sendMagicEffect(CONST_ME_POFF)
		return true
	end

	player:setStorageValue(949, player:getStorageValue(949) + 1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have gathered the correct spores.')
	Item(item.uid):transform(item.itemid + 1)
	toPosition:sendMagicEffect(CONST_ME_GREEN_RINGS)
	return true
end
