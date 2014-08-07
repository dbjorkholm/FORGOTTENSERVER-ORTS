local config = {
	[50135] = Position(32336, 31813, 6), -- to the room
	[50136] = Position(32337, 31815, 7) -- outside the room
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local useItem = config[item.uid]
	if not useItem then
		return true
	end

	local player = Player(cid)
	if player:getStorageValue(Storage.thievesGuild.Mission02) > 0 then
		player:teleportTo(useItem)
	end

	return true
end
