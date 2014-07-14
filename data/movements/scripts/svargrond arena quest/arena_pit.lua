function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	SvargrondArena.cancelEvents(cid)
	if item.actionid == 25300 then
		local condition = Condition(CONDITION_OUTFIT, CONDITIONID_COMBAT)
		condition:setTicks(120000)
		condition:addOutfit({lookType = 111})
		player:addCondition(condition)

		player:setStorageValue(Storage.SvargrondArena.Pit, 0)
		player:teleportTo(SvargrondArena.kickPosition)
		player:say('Coward!', TALKTYPE_MONSTER_SAY)
		return true
	end

	local pitId = player:getStorageValue(Storage.SvargrondArena.Pit)
	local arenaId = player:getStorageValue(Storage.SvargrondArena.Arena)
	if pitId > 10 then
		SvargrondArena.rewardPosition:sendMagicEffect(arenaId == 1 and CONST_ME_FIREWORK_BLUE or arenaId == 2 and CONST_ME_FIREWORK_YELLOW or CONST_ME_FIREWORK_RED)
		player:teleportTo(SvargrondArena.rewardPosition)
		player:setStorageValue(Storage.SvargrondArena.Pit, 0)
		player:setStorageValue(SvargrondArena.getActionIdByArena(arenaId), 1)
		player:setStorageValue(Storage.SvargrondArena.Arena, player:getStorageValue(Storage.SvargrondArena.Arena) + 1)
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, 'Congratulations! You completed ' .. ARENA[arenaId].name .. ' arena, you should take your reward now.')
		player:say(arenaId == 1 and 'Welcome back, little hero!' or arenaId == 2 and 'Congratulations, brave warrior!' or 'Respect and honour to you, champion!', TALKTYPE_MONSTER_SAY)
		return true
	end

	local occupant = SvargrondArena.getPitOccupant(pitId, player)
	if occupant then
		player:sendTextMessage(MESSAGE_INFO_DESCR, occupant:getName() .. ' is currently in the next arena pit. Please wait until ' .. (occupant:getSex() == 0 and 's' or '') .. 'he is done fighting.')
		player:teleportTo(fromPosition)
		return true
	end

	SvargrondArena.resetPit(pitId)
	SvargrondArena.scheduleKickPlayer(cid, pitId)
	Game.createMonster(ARENA[arenaId].creatures[pitId], PITS[pitId].summon, true, true)

	player:teleportTo(PITS[pitId].center)
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
	player:say('Fight!', TALKTYPE_MONSTER_SAY)
	return true
end