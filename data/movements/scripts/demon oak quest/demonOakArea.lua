local floorDamage =
{
	min = 270,
	max = 310,
	type = COMBAT_EARTHDAMAGE,
	effect = CONST_ME_BIGPLANTS
}

function onStepIn(cid, item, position, fromPosition)
	if (isPlayer(cid) and math.random(1, 24) == 1) then
		doTargetCombatHealth(0, cid, floorDamage.type, -floorDamage.min, -floorDamage.max, floorDamage.effect)
	end
	return true
end