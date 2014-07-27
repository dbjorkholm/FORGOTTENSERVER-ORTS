function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return
	end

	if not player:hasAllowMovement() then
		player:teleportTo(fromPosition, true)
	end
	return true
end

function onStepOut(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return
	end

	if not player:hasAllowMovement() then
		player:teleportTo(fromPosition, true)
	end
	return true
end