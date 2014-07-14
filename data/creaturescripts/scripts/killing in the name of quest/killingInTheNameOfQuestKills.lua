function onKill(cid, target, lastHit)
	local targetCreature = Creature(target)
	if targetCreature:isPlayer() or targetCreature:getMaster() then
		return true
	end

	local player = Player(cid)
	local started = getPlayerStartedTasks(cid)
	if started and #started > 0 then
		for _, taskId in ipairs(started) do
			if isInArray(tasks[taskId].creatures, targetCreature:getName():lower()) then
				local killAmount = player:getStorageValue(KILLSSTORAGE_BASE + taskId)
				if killAmount < tasks[taskId].killsRequired then
					player:setStorageValue(KILLSSTORAGE_BASE + taskId, killAmount + 1)
				end
			end
		end
	end
	return true
end