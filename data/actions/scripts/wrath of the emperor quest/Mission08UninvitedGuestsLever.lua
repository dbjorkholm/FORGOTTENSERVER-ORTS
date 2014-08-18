local config = {
	[3184] = {destination = Position(33082, 31110, 2)},
	[3185] = {destination = Position(33078, 31080, 13)}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local Startposition = {x = toPosition.x, y = toPosition.y + 1, z = toPosition.z} -- Startposition of elevator always south of lever
	local Elevatoruser = Tile(Position(Startposition)):getTopCreature() -- get player who stand on the Startposition elevator

	if not Elevatoruser or not Elevatoruser:isPlayer() then -- creature and player check
		Item(item.uid):transform(item.itemid == 1945 and 1946 or 1945)
		return true
	end

	local lever = config[item.uid]
	if lever and item.itemid == 1945 then
		Elevatoruser:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		Elevatoruser:teleportTo(lever.destination)
		lever.destination:sendMagicEffect(CONST_ME_TELEPORT)
	end
	Item(item.uid):transform(item.itemid == 1945 and 1946 or 1945)
	return true
end