function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	if player:getStorageValue(Storage.QueenOfBansheesQuest.SecondSeal) < 1 then
		player:setStorageValue(Storage.QueenOfBansheesQuest.SecondSeal, 1)
		player:teleportTo(Position(32272, 31849, 15))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		player:teleportTo(fromPosition, true)
		fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end