function onStepIn(cid, item, position, fromPosition)
	if (isPlayer(cid)) then
		local arena = getPlayerStorageValue(cid, STORAGE_ARENA) - 1
		if arena == item.uid - 23200 then --trophy tile actionid should be 23201 23202 23203
			if (getPlayerStorageValue(cid, ARENA[arena].reward.trophyStorage) < 1) then
				local pos = getCreaturePosition(cid)
				pos.y = pos.y - 1
				local thing = doCreateItem(ARENA[arena].reward.trophy, 1, pos)
				doSetItemSpecialDescription(thing, string.format(ARENA[arena].reward.desc, getCreatureName(cid)))
				setPlayerStorageValue(cid, ARENA[arena].reward.trophyStorage, 1)
				doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_RED)
			return true
			end
		end
	end
	return true
end