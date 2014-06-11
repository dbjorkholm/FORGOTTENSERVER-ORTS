function onKill(cid, target)
	local monster = Monster(target)
	local player = Player(cid)
	local TheNewFrontierQuestStorage = 12144 --TheNewFrontierQuestline_Storage
	if monster then
		if string.lower(monster:getName()) == "shard of corruption" then
			if player:getStorageValue(TheNewFrontierQuestStorage) == 12 then
				player:setStorageValue(TheNewFrontierQuestStorage, 13)
				player:setStorageValue(12134, 2) --Questlog, The New Frontier Quest "Mission 04: The Mine Is Mine"
			end
		end
	end
	return true
end