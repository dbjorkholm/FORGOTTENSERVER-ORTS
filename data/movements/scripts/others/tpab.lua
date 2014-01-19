local t = {
	[9700] = {pos = {x = 32667, y = 31681, z = 6}},
	[9701] = {pos = {x = 32726, y = 31666, z = 6}},
	[9702] = {pos = {x = 32674, y = 31617, z = 6}},
	[9703] = {pos = {x = 32664, y = 31679, z = 6}},
	[9704] = {pos = {x = 32658, y = 31688, z = 8}},
	[9705] = {pos = {x = 32655, y = 31688, z = 6}}
} 

function onStepIn(cid, item, pos)
	local creature = Creature(cid)
	local v = t[item.actionid]
	if Player(cid) then
		if v then
			creature:teleportTo(v.pos)
			Position(v.pos):sendMagicEffect(CONST_ME_POFF)
		end
	end
end