function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	--trophy tile actionid should be 23201 23202 23203
	local arenaId = player:getStorageValue(Storage.SvargrondArena.Arena) - 1
	if arenaId == item.uid - 23200 and player:getStorageValue(ARENA[arenaId].reward.trophyStorage) < 1 then
		local rewardPosition = player:getPosition()
		rewardPosition.y = rewardPosition.y - 1

		local rewardItem = Game.createItem(ARENA[arenaId].reward.trophy, 1, rewardPosition)
		if rewardItem then
			rewardItem:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, string.format(ARENA[arenaId].reward.desc, player:getName()))
		end

		player:setStorageValue(ARENA[arenaId].reward.trophyStorage, 1)
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
	end
	return true
end