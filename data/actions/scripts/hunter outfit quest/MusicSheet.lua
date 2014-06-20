local config = {
	[6087] = {12050, 6087, "first"},
	[6088] = {12051, 6088, "second"},
	[6089] = {12052, 6089, "third"},
	[6090] = {12053, 6090, "fourth"}
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
