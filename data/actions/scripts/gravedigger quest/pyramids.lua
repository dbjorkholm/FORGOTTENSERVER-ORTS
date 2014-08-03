local config = {
	[4646] = {storageKey = {9981, 9982}},
	[4647] = {storageKey = {9982, 9883}},
	[4648] = {storageKey = {9983, 9884}},
	[4649] = {storageKey = {9984, 9885}}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local targetItem = config[itemEx.actionid]
	if not targetItem then
		return true
	end
	
	local player = Player(cid)
	if player:getStorageValue(targetItem.storageKey[1]) == 1 and player:getStorageValue(targetItem.storageKey[2]) < 1 then
		player:setStorageValue(targetItem.storageKey[2], 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, '<sizzle> <fizz>')
		player:getPosition():sendMagicEffect(CONST_ME_ENERGYHIT)
	end
	return true
end