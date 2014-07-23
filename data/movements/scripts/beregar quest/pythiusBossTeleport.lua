local positions = {
	Position(32551, 31379, 15),
	Position(32551, 31378, 15),
	Position(32551, 31377, 15),
	Position(32551, 31376, 15),
	Position(32551, 31375, 15),
	Position(32551, 31374, 15),
	Position(32551, 31373, 15),
	Position(32550, 31373, 15),
	Position(32550, 31374, 15),
	Position(32550, 31375, 15),
	Position(32550, 31376, 15),
	Position(32550, 31377, 15),
	Position(32550, 31378, 15),
	Position(32550, 31379, 15)
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return
	end
	
	Game.createMonster("Pythius the Rotten", Position(32566, 31400, 15))
	player:teleportTo(Position(32566, 31406, 15))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	for i = 1, #positions do
		local ground = Tile(positions[i]):getGround()
		if ground and ground:getId() == 5815 then
			ground:transform(598)
		end
	end
	local steamPos = Position(32551, 31379, 15)
	Game.createItem(1304, 1, steamPos)
	local steam = Game.createItem(9341, 1, steamPos)
	if steam then
		steam:setActionId(50127)
	end
	return true
end
