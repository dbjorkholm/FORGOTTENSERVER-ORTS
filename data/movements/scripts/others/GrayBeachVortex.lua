function onStepIn(cid, item, pos, fromPosition)
local t = {
	[9238] = {pos = {x=33456,y=31346,z=8}},
	[9239] = {pos = {x=33199,y=31978,z=8}},
}
	local v = t[item.uid]
	if (isPlayer(cid)) then
		if v then
			Creature(cid):teleportTo(v.pos)
			Position(v.pos):sendMagicEffect(CONST_ME_WATERSPLASH)
			Player(cid):sendTextMessage(MESSAGE_EVENT_ADVANCE, "You dive into the vortex to swim below the rocks to the other side of the cave.")	
		end
	end
	return true
end
