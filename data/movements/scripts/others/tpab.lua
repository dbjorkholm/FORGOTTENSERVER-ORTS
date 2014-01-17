function onStepIn(cid, item, pos)

local ship = {x = 32726, y = 31666, z = 6}
local center = {x = 32667, y = 31681, z = 6}
local center2 = {x = 32664, y = 31679, z = 6}
local center3 = {x = 32655, y = 31688, z = 6}
local cave = {x = 32658, y = 31688, z = 8}
local hill = {x = 32674, y = 31617, z = 6}
local creature = Creature(cid)

	if Player(cid) then
		if item.actionid == 9700 then
			creature:teleportTo(center)
			Position(center):sendMagicEffect(CONST_ME_POFF)
		end
		if item.actionid == 9701 then
			creature:teleportTo(ship)
			Position(ship):sendMagicEffect(CONST_ME_POFF)
		end
		if item.actionid == 9702 then
			creature:teleportTo(hill)
			Position(hill):sendMagicEffect(CONST_ME_POFF)
		end
		if item.actionid == 9703 then
			creature:teleportTo(center2)
			Position(center2):sendMagicEffect(CONST_ME_POFF)
		end
		if item.actionid == 9704 then
			creature:teleportTo(cave)
			Position(cave):sendMagicEffect(CONST_ME_POFF)
		end
		if item.actionid == 9705 then
			creature:teleportTo(center3)
			Position(center3):sendMagicEffect(CONST_ME_POFF)
		end
	end
end