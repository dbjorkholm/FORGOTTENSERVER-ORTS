local amfora = Position(32988, 32397, 9)
local amfora2 = Position(32987, 32401, 9)

function onStepIn(cid, item, position)
	local player = Player(cid)
	local creature = Creature(cid)

	if not player then
		return true
	end

	if item.actionid == 4530 and player:getStorageValue(9995) == 1 and player:getStorageValue(9996) < 1 then
		creature:teleportTo(amfora2)
		amfora2:sendMagicEffect(CONST_ME_POFF)
	else
		creature:teleportTo(amfora)
		amfora:sendMagicEffect(CONST_ME_POFF)
	end
	return true
end
