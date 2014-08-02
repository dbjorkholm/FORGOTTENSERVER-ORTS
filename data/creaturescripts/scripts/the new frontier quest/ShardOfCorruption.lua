function onKill(cid, target)
	local targetMonster = Monster(target)
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'shard of corruption' then
		return true
	end

	local player = Player(cid)
	if player:getStorageValue(Storage.TheNewFrontier.Questline) == 12 then
		--Questlog, The New Frontier Quest 'Mission 04: The Mine Is Mine'
		player:setStorageValue(Storage.TheNewFrontier.Mission04, 2)
		player:setStorageValue(Storage.TheNewFrontier.Questline, 13)
	end
	return true
end