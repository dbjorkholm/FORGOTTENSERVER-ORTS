function onStepIn(cid, item, pos)

local brain = {x = 33022, y = 32338, z = 10}
local brain2 = {x = 33022, y = 32334, z = 10}
local player = Player(cid)
local creature = Creature(cid)

	if item.actionid == 4532 and (player:getStorageValue(9998) == 1) and (player:getStorageValue(9999) < 1) then
		creature:teleportTo(brain2)
		Position(brain2):sendMagicEffect(CONST_ME_POFF)
	else
		creature:teleportTo(brain)
		Position(brain):sendMagicEffect(CONST_ME_POFF)
	end
	
	if item.actionid == 4533 then
		creature:teleportTo(brain)
		Position(brain):sendMagicEffect(CONST_ME_POFF)
	end
	

end