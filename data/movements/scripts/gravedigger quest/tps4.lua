function onStepIn(cid, item, pos)

local sacrifice = {x = 33021, y = 32419, z = 11}
local sacrifice2 = {x = 33015, y = 32422, z = 11}
local player = Player(cid)
local creature = Creature(cid)

	if item.actionid == 4541 and (player:getStorageValue(9948) == 1) then
		creature:teleportTo(sacrifice2)
		Position(sacrifice2):sendMagicEffect(CONST_ME_POFF)
	else
		creature:teleportTo(sacrifice)
		Position(sacrifice):sendMagicEffect(CONST_ME_POFF)
	end
	
	if item.actionid == 4542 then
		creature:teleportTo(sacrifice)
		Position(sacrifice):sendMagicEffect(CONST_ME_POFF)
	end
	

end