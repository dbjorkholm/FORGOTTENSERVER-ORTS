local config = {
	[23702] = {{x = 32876, y = 31321, z = 10}},
	[23703] = {{x = 32875, y = 31321, z = 10}}
}

function onStepIn(cid, item, position, lastPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	local machines = config[item.actionid]
	if not machines then
		return true
	end
	player:teleportTo(machines[1])
	return true
end