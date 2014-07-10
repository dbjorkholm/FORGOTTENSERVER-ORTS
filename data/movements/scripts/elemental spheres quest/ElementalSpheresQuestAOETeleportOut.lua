local Area_fromPos, Area_toPos = Position(33235, 31801, 12), Position(33299, 31867, 12)
	
function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)

	if isPlayer(cid) then
		if isPlayerInArea(Area_fromPos, Area_toPos) then
			player:teleportTo(Position(33265, 31838, 10))
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:setStorageValue(10005, 0)
			player:setStorageValue(10006, 0)
			player:setStorageValue(10007, 0)
			player:setStorageValue(10008, 0)
			print("Player is here")
		else
			Game.setStorageValue(10004, 0)	
			player:teleportTo(Position(33265, 31838, 10))
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:setStorageValue(10005, 0)
			player:setStorageValue(10006, 0)
			player:setStorageValue(10007, 0)
			player:setStorageValue(10008, 0)	
			print("Player is not here")
		end
	end
	return true
end
