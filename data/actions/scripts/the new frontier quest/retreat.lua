function onUse(cid, item, fromPosition, itemEx, toPosition)
	local destination = Position(33170, 31247, 11)
	Player(cid):teleportTo(destination)
	destination:sendMagicEffect(CONST_ME_POFF)
	return true
end