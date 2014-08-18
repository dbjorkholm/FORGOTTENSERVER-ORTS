local config = {
	[3184] = Position(33082, 31110, 2),
	[3185] = Position(33078, 31080, 13)
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local Elevatoruser = Tile(Position({x = toPosition.x, y = toPosition.y + 1, z = toPosition.z})):getTopCreature() -- get player who stand on the Startposition elevator

	if not Elevatoruser or not Elevatoruser:isPlayer() then -- creature and player check
		Item(item.uid):transform(item.itemid == 1945 and 1946 or 1945)
		return true
	end

	local lever = config[item.uid]
	if not lever then
		return true
	end
	if item.itemid == 1945 then
		Elevatoruser:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		Elevatoruser:teleportTo(lever)
		lever:sendMagicEffect(CONST_ME_TELEPORT)
	end
	Item(item.uid):transform(item.itemid == 1945 and 1946 or 1945)
	return true
end