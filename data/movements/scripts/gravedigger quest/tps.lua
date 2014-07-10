local amfora = Position(32988, 32397, 9)
local amfora2 = Position(32987, 32401, 9)

function onStepIn(cid, item, position)
	local player = Player(cid)

	if not player then
		return true
	end

	if item.actionid == 4530 and player:getStorageValue(9995) == 1 and player:getStorageValue(9996) < 1 then
		player:teleportTo(amfora2)
		amfora2:sendMagicEffect(CONST_ME_POFF)
	else
		player:teleportTo(amfora)
		amfora:sendMagicEffect(CONST_ME_POFF)
	end
	return true
end
