local config = {
	[3167] = {Storage.ChildrenoftheRevolution.Questline, Position({x = 33257, y = 31116, z = 8}), Position({x = 33356, y = 31126, z = 7})},
	[3168] = {Storage.ChildrenoftheRevolution.Questline, Position({x = 33356, y = 31125, z = 7}), Position({x = 33261, y = 31079, z = 8})}
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	local targetTile = config[item.uid]
	if not player then 
		return true
	end

	if not targetTile then
		return true
	end
	
	if player:getStorageValue(targetTile[1]) >= 19 then
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(targetTile[2])
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(targetTile[3])
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say("This portal should not be entered unprepared", TALKTYPE_ORANGE_1)
	end
	return true
end