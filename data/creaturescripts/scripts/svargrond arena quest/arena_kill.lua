function onKill(cid, target)
	local targetMonster = Monster(target)
	if not targetMonster then
		return true
	end

	local player = Player(cid)
	local pit = player:getStorageValue(Storage.SvargrondArena.Pit)
	if pit < 1 or pit > 10 then
		return true
	end

	local arena = player:getStorageValue(Storage.SvargrondArena.Arena)
	if arena < 1 then
		return true
	end

	if not isInArray(ARENA[arena].creatures, targetMonster:getName():lower()) then
		return true
	end

	-- Remove pillar and create teleport
	local pillarTile = Tile(PITS[pit].pillar)
	if pillarTile then
		local pillarItem = pillarTile:getItemById(SvargrondArena.itemPillar)
		if pillarItem then
			pillarItem:remove()

			local teleportItem = Game.createItem(SvargrondArena.itemTeleport, 1, PITS[pit].tp)
			if teleportItem then
				teleportItem:setActionId(25200)
			end

			SvargrondArena.sendPillarEffect(pit)
		end
	end

	player:setStorageValue(Storage.SvargrondArena.Pit, pit + 1)
	player:say('Victory! Head through the new teleporter into the next room.', TALKTYPE_MONSTER_SAY)
	return true
end