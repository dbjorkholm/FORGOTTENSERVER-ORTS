local config = {
	[4641] = {9972, 9973, "Shadows rise and engulf the candle. The statue flickers in an unearthly light."},
	[4642] = {9973, 9874, "The shadows of the statue swallow the candle hungrily."},
	[4643] = {9974, 9875, "A shade emerges and snatches the candle from your hands."}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	local targetItem = config[itemEx.actionid]
	if not targetItem then
		return true
	end
	
	if player:getStorageValue(targetItem[1]) == 1 and player:getStorageValue(targetItem[2]) < 1 then
		player:setStorageValue(targetItem[2], 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("%s", targetItem[3]))
		Item(item.uid):remove(1)
	end
	return true
end