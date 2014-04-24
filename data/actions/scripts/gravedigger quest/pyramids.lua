local config = {
	[4646] = {9981, 9982},
	[4647] = {9982, 9883},
	[4648] = {9983, 9884},
	[4649] = {9984, 9885}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	local targetItem = config[itemEx.actionid]
	if not targetItem then
		return true
	end
	
	if player:getStorageValue(targetItem[1]) == 1 and player:getStorageValue(targetItem[2]) < 1 then
		player:setStorageValue(targetItem[2], 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, '<sizzle> <fizz>')
		player:getPosition():sendMagicEffect(CONST_ME_ENERGYHIT)
	end
	return true
end