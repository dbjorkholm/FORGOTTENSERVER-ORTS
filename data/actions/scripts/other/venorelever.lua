function onUse(cid, item, fromPosition, itemEx, toPosition)

	local up = {x=33051, y=32099, z=6}
	local down = {x=33051, y=32099, z=7}
	local creature = Creature(cid)

	if item.actionid == 9743 then
		creature:teleportTo(up, TRUE)
		creature:say("Zrrrt!", TALKTYPE_MONSTER_SAY)
		Position(pos):sendMagicEffect(10)
		else
			if item.actionid == 9744 then
				creature:teleportTo(down, TRUE)
				creature:say("Zrrrt!", TALKTYPE_MONSTER_SAY)
				Position(pos):sendMagicEffect(10)
			end
	end
end