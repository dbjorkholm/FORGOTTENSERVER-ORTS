local sacrifice = Position(33021, 32419, 11)
local sacrifice2 = Position(33015, 32422, 11)

function onStepIn(cid, item, position)
	local player = Player(cid)
	local creature = Creature(cid)

	if not player then
		return true
	end

	if item.actionid == 4541 and player:getStorageValue(9948) == 1 then
		creature:teleportTo(sacrifice2)
		sacrifice2:sendMagicEffect(CONST_ME_POFF)
	else
		creature:teleportTo(sacrifice)
		sacrifice:sendMagicEffect(CONST_ME_POFF)
	end

	if item.actionid == 4542 then
		creature:teleportTo(sacrifice)
		sacrifice:sendMagicEffect(CONST_ME_POFF)
	end
	return true
end
