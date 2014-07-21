local destinations = {
	{teleportPos = Position(Position(32692, 31501, 11)), railCheck = Tile(Position(32688, 31469, 13)):getItemById(7124) and Tile(Position(32690, 31465, 13)):getItemById(7122)} --Coal Room
	{teleportPos = Position(), railCheck = Tile(Position(32688, 31469, 13)):getItemById(7124) and Tile(Position(32690, 31465, 13)):getItemById(7125) and Tile(Position(32684, 31464, 13)):getItemById(7123)} --Infested Tavern. I'm not sure where this is, anyone?
	{teleportPos = Position(Position(32579, 31487, 9)), railCheck = Tile(Position(32688, 31469, 13)):getItemById(7124) and Tile(Position(32690, 31465, 13)):getItemById(7125) and Tile(Position(32684, 31464, 13)):getItemById(7122) and Tile(Position(32682, 31455, 13)):getItemById(7124)} --Beregar
	{teleportPos = Position(Position(32701, 31448, 15)), railCheck = Tile(Position(32688, 31469, 13)):getItemById(7124) and Tile(Position(32690, 31465, 13)):getItemById(7125) and Tile(Position(32684, 31464, 13)):getItemById(7122) and Tile(Position(32682, 31455, 13)):getItemById(7121) and Tile(Position(32687, 31452, 13)):getItemById(7125) and Tile(Position(32692, 31453, 13)):getItemById(7126)} --NPC Tehlim
	{teleportPos = Position(Position(32721, 31487, 15)), railCheck = Tile(Position(32688, 31469, 13)):getItemById(7121) and Tile(Position(32692, 31459, 13)):getItemById(7123) and Tile(Position(32696, 31453, 13)):getItemById(7123)} --Troll tribe's hideout
	{teleportPos = Position(Position(32600, 31504, 13)), railCheck = Tile(Position(32688, 31469, 13)):getItemById(7123) and Tile(Position(32695, 31464, 13)):getItemById(7123)} --City's Entrance
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	
	for i = 1, #config do
		local table = config[i]
		if table.railCheck then
			player:teleportTo(table.teleportPos)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		end
	end
	return true
end
