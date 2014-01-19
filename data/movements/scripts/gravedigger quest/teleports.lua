function onStepIn(cid, item, pos)

local amfora = {x = 32988, y = 32397, z = 9}
local amfora2 = {x = 32987, y = 32401, z = 9}
local player = Player(cid)
local creature = Creature(cid)

	if item.actionid == 4530 and (player:getStorageValue(9995) == 1) and (player:getStorageValue(9996) < 1) then
		creature:teleportTo(amfora2)
		Position(amfora2):sendMagicEffect(CONST_ME_POFF)
	else
		creature:teleportTo(amfora)
		Position(amfora):sendMagicEffect(CONST_ME_POFF)
	end
	
	if item.actionid == 4531 then
		creature:teleportTo(amfora)
		Position(amfora):sendMagicEffect(CONST_ME_POFF)
	end

end