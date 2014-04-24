function onStepIn(cid, item, pos)

local out = {x = 32308, y = 32267, z = 7}
local creature = Creature(cid)
local player = Player(cid)

	if (player:getVocation():getId() == 1 or player:getVocation():getId() == 5) then
		return false
	else
		creature:teleportTo(out)
		Position(out):sendMagicEffect(CONST_ME_MAGIC_BLUE)
	end
end