local config = {
	[12501] = Position(32336, 31813, 6), -- to the room
	[12502] = Position(32337, 31815, 7) -- outside the room
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local targetPosition = config[item.actionid]
	if not targetPosition then
		return true
	end

	Player(cid):teleportTo(targetPosition)

	return true
end
