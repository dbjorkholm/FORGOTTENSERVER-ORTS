function onStepIn(cid, item, position, lastPosition)
	local player = Player(cid)
	if not player then
		return false
	end
	Game.createMonster("Ghost", {x = 32276, y = 31902, z = 13}, false, true)
	Game.createMonster("Ghost", {x = 32274, y = 31902, z = 13}, false, true)
	Game.createMonster("Demon Skeleton", {x = 32276, y = 31904, z = 13}, false, true)
	return true
end
