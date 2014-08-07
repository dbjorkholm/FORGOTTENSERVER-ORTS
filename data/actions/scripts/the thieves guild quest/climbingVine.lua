local config = {
	[50135] = Position(32336, 31813, 6), -- to the room
	[50136] = Position(32337, 31815, 7) -- outside the room
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local useItem = config[item.uid]
	if not useItem then
		return true
	end

	Player(cid):teleportTo(useItem)

	return true
end
