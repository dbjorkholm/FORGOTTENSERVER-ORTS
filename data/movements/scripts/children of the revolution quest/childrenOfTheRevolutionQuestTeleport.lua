local config = {
	[3167] = {storageKey = Storage.ChildrenoftheRevolution.Questline, toPosition = {Position(33257, 31116, 8), Position(33356, 31126, 7)}},
	[3168] = {storageKey = Storage.ChildrenoftheRevolution.Questline, toPosition = {Position(33356, 31125, 7), Position(33261, 31079, 8)}}
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then 
		return true
	end

	local targetTile = config[item.uid]
	if not targetTile then
		return true
	end
	
	local playerPos = player:getPosition()
	if player:getStorageValue(targetTile.storageKey) >= 19 then
		playerPos:sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(targetTile.toPosition[1])
		playerPos:sendMagicEffect(CONST_ME_TELEPORT)
	else
		playerPos:sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(targetTile.toPosition[2])
		playerPos:sendMagicEffect(CONST_ME_TELEPORT)
		player:say('This portal should not be entered unprepared', TALKTYPE_MONSTER_SAY)
	end
	return true
end