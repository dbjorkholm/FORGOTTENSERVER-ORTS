function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	
	Game.createMonster("Pythius the Rotten", Position(32566, 31400, 15))
	player:teleportTo(Position(32566, 31406, 15))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	Tile(Position(32551, 31379, 15)):getGround():getId():transform(598)
	Tile(Position(32551, 31378, 15)):getGround():getId():transform(598)
	Tile(Position(32551, 31377, 15)):getGround():getId():transform(598)
	Tile(Position(32551, 31376, 15)):getGround():getId():transform(598)
	Tile(Position(32551, 31375, 15)):getGround():getId():transform(598)
	Tile(Position(32551, 31374, 15)):getGround():getId():transform(598)
	Tile(Position(32551, 31373, 15)):getGround():getId():transform(598)
	Tile(Position(32550, 31373, 15)):getGround():getId():transform(598)
	Tile(Position(32550, 31374, 15)):getGround():getId():transform(598)
	Tile(Position(32550, 31375, 15)):getGround():getId():transform(598)
	Tile(Position(32550, 31376, 15)):getGround():getId():transform(598)
	Tile(Position(32550, 31377, 15)):getGround():getId():transform(598)
	Tile(Position(32550, 31378, 15)):getGround():getId():transform(598)
	Tile(Position(32550, 31379, 15)):getGround():getId():transform(598)
	Game.createItem(1304, Position(32551, 31379, 15))
	local steam = Game.createItem(Position(9341, 32551, 31379, 15))
	steam:setActionId(50127)
	return true
end
