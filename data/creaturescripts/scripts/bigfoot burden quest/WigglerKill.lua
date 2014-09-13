function onKill(cid, target)
	local targetMonster = Monster(target)
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'wiggler' then
		return true
	end

	local player = Player(cid)
	local value = player:getStorageValue(Storage.BigfootBurden.ExterminatedCount)
	if value < 10 and player:getStorageValue(Storage.BigfootBurden.MissionExterminators) == 1 then
		player:setStorageValue(Storage.BigfootBurden.ExterminatedCount, value + 1)
	end
	return true
end