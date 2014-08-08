local destinations = {
	[2000] = Position(32791, 32331, 10),
	[2001] = Position(32791, 32327, 10)
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return false
	end

	if player:getItemCount(1970) < 1 then
		player:teleportTo(fromPosition)
		return true
	end

	player:teleportTo(destinations[item.uid])
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end
