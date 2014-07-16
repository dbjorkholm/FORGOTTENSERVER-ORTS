local Area_fromPos, Area_toPos = Position(33235, 31801, 12), Position(33299, 31867, 12)

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	
	if not isPlayerInArea(Area_fromPos, Area_toPos) then
		Game.setStorageValue(10004)
	end

	player:teleportTo(Position(33265, 31838, 10))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	for i = 10005, 10008 do
		player:setStorageValue(i, 0)
	end
	return true
end
