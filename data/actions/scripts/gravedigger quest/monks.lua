local config = {
	[4641] = {storageKey = {Storage.GravediggerOfDrefia.Mission32, Storage.GravediggerOfDrefia.Mission32a}, message = 'Shadows rise and engulf the candle. The statue flickers in an unearthly light.'},
	[4642] = {storageKey = {Storage.GravediggerOfDrefia.Mission32a, Storage.GravediggerOfDrefia.Mission32b}, message = 'The shadows of the statue swallow the candle hungrily.'},
	[4643] = {storageKey = {Storage.GravediggerOfDrefia.Mission32b, Storage.GravediggerOfDrefia.Mission33}, message = 'A shade emerges and snatches the candle from your hands.'}
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
		Item(item.uid):remove(1)
	end
	return true
end