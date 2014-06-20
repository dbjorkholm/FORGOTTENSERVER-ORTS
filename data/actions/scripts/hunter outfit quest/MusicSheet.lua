local config = {
	[6087] = {Storage.OutfitQuest.HunterMusicSheet01, 6087, "first"},
	[6088] = {Storage.OutfitQuest.HunterMusicSheet02, 6088, "second"},
	[6089] = {Storage.OutfitQuest.HunterMusicSheet03, 6089, "third"},
	[6090] = {Storage.OutfitQuest.HunterMusicSheet04, 6090, "fourth"}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	local targetItem = config[item.itemid]
	if not targetItem then
		return true
	end
	
	if player:getStorageValue(targetItem[1]) ~= 1 then
		player:setStorageValue(targetItem[1], 1)
		Item(item.uid):remove(1)
		player:sendTextMessage(MESSAGE_STATUS_WARNING, string.format("You have learned the %s part of a hymn.", targetItem[3]))
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
	else
		player:sendTextMessage(MESSAGE_STATUS_WARNING, string.format("You already know the %s verse of the hymn.", targetItem[3]))
	end
	return true
end
