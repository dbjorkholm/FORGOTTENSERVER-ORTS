local config = {
	[3153] = Position(33022, 31536, 6),
	[3154] = Position(33020, 31536, 4)
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local targetPosition = config[item.uid]
	if not targetPosition then
		return true
	end

	Player(cid):teleportTo(targetPosition)
	targetPosition:sendMagicEffect(CONST_ME_POFF)
	return true
end
