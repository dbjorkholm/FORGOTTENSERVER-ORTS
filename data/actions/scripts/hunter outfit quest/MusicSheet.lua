local config = {
	[6087] = {storageKey = Storage.OutfitQuest.HunterMusicSheet01, text = 'first'},
	[6088] = {storageKey = Storage.OutfitQuest.HunterMusicSheet02, text = 'second'},
	[6089] = {storageKey = Storage.OutfitQuest.HunterMusicSheet03, text = 'third'},
	[6090] = {storageKey = Storage.OutfitQuest.HunterMusicSheet04, text = 'fourth'}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local useItem = config[item.itemid]
	if not useItem then
		return true
	end

	local player = Player(cid)
	if player:getStorageValue(useItem.storageKey) ~= 1 then
		player:setStorageValue(useItem.storageKey, 1)
		player:sendTextMessage(MESSAGE_STATUS_WARNING, 'You have learned the ' .. useItem.text .. ' part of a hymn.')
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
		Item(item.uid):remove(1)
	else
		player:sendTextMessage(MESSAGE_STATUS_WARNING, 'You already know the ' .. useItem.text .. ' verse of the hymn.')
	end
	return true
end
