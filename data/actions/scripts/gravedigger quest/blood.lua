local config = {
	[4644] = {storageKey = {Storage.GravediggerOfDrefia.Mission36, Storage.GravediggerOfDrefia.Mission36a}, message = 'The blood in the vial is of a deep, ruby red.', itemId = 21418},
	[4645] = {storageKey = {Storage.GravediggerOfDrefia.Mission36a, Storage.GravediggerOfDrefia.Mission37}, message = 'The blood in the vial is of a strange colour, as if tainted.', itemId = 21419}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local targetItem = config[itemEx.actionid]
	if not targetItem then
		return true
	end

	local player = Player(cid)
	local cStorages = targetItem.storageKey
	if player:getStorageValue(cStorages[1]) == 1 and player:getStorageValue(cStorages[2]) < 1 then
		player:setStorageValue(cStorages[2], 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, targetItem.message)
		player:addItem(targetItem.itemId, 1)
		Item(item.uid):remove(1)
	end
	return true
end