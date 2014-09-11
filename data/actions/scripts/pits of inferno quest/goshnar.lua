function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.actionid ~= 2023 then
		return false
	end
	
	if not Tile(toPosition):getItemById(2016, 2) then
		return true
	end

	toPosition.z = toPosition.z + 1
	Player(cid):teleportTo(toPosition)
	toPosition:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
