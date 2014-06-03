function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.uid == 3156 then
		Player(cid):teleportTo(destination)
		Position({x = 33170, y = 31247, z = 11}):sendMagicEffect(CONST_ME_POFF)
	end
	return true
end