local config = {
	[4641] = {storageKey = {9972, 9973}, message = 'Shadows rise and engulf the candle. The statue flickers in an unearthly light.'},
	[4642] = {storageKey = {9973, 9874}, message = 'The shadows of the statue swallow the candle hungrily.'},
	[4643] = {storageKey = {9974, 9875}, message = 'A shade emerges and snatches the candle from your hands.'}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local targetItem = config[itemEx.actionid]
	if not targetItem then
		return true
	end
	
	local player = Player(cid)
	if player:getStorageValue(targetItem.storageKey[1]) == 1 and player:getStorageValue(targetItem.storageKey[2]) < 1 then
		player:setStorageValue(targetItem.storageKey[2], 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, targetItem.message)
		Item(item.uid):remove(1)
	end
	return true
end