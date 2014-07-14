local function getEffectPositions(pos)
	return	{
				{x = pos.x - 1, y = pos.y,     z = pos.z},
				{x = pos.x + 1, y = pos.y,     z = pos.z},
				{x = pos.x + 1, y = pos.y - 1, z = pos.z},
				{x = pos.x + 1, y = pos.y + 1, z = pos.z},
				{x = pos.x,     y = pos.y,     z = pos.z}
			}
end

function onKill(cid, target)
	local monster = Monster(target)
	if not monster then
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

	if isInArray(ARENA[arena].creatures, monster:getName():lower()) then
		local pillarTile = Tile(PITS[pit].pillar)
		if pillarTile then
			local pillarItem = pillarTile:getItemById(SvargrondArena.itemPillar)
			if pillarItem then
				pillarItem:remove()

				local teleportItem = Game.createItem(SvargrondArena.itemTeleport, 1, PITS[pit].tp)
				if teleportItem then
					teleportItem:setActionId(25200)
				end

				for _, position in ipairs(getEffectPositions(PITS[pit].pillar)) do
					Position(position):sendMagicEffect(CONST_ME_MAGIC_BLUE)
				end
			end
		end

		player:setStorageValue(Storage.SvargrondArena.Pit, pit + 1)
		player:say("Victory! Head through the new teleporter into the next room.", TALKTYPE_MONSTER_SAY)
	end
	return true
end