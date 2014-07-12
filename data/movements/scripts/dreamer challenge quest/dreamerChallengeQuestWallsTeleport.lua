local wall = {
	Position(32760, 32288, 14),
	Position(32761, 32288, 14),
	Position(32762, 32288, 14),
	Position(32763, 32288, 14),
	Position(32764, 32288, 14),
	Position(32764, 32289, 14),
	Position(32764, 32290, 14),
	Position(32764, 32291, 14),
	Position(32764, 32292, 14),
	Position(32763, 32292, 14),
	Position(32762, 32292, 14),
	Position(32761, 32292, 14),
	Position(32760, 32292, 14),
	Position(32760, 32291, 14),
	Position(32760, 32290, 14),
	Position(32760, 32289, 14)
}

function onStepIn(cid, item, position)
	local player = Player(cid)

	for i = 1, #wall do
		if Tile(wall[i]):getThing() ~= 0 then
			player:teleportTo(Position(32762, 32305, 14))
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		else
			player:teleportTo(Position(32852, 32287, 14))
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		end
	end
	return TRUE
end
