local brain = Position(33022, 32338, 10)
local brain2 = Position(33022, 32334, 10)

function onStepIn(cid, item, position)
	local player = Player(cid)

	if not player then
		return true
	end

	if item.actionid == 4532 and player:getStorageValue(9998) == 1 and player:getStorageValue(9999) < 1 then
		player:teleportTo(brain2)
		brain2:sendMagicEffect(CONST_ME_POFF)
	else
		player:teleportTo(brain)
		brain:sendMagicEffect(CONST_ME_POFF)
	end
	return true
end
