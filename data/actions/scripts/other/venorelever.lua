local config = {
	[9743] = Position(33051, 32099, 6),
	[9744] = Position(33051, 32099, 7)
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local targetPosition = config[item.actionid]
	if not targetPosition then
		return true
	end
	
	local player = Player(cid)
	player:teleportTo(targetPosition)
	player:say("Zrrrt!", TALKTYPE_MONSTER_SAY)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end