function onKill(cid, target)
	local targetMonster = Monster(target)
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'nomad' then
		return true
	end

	local player = Player(cid)
	if player:getStorageValue(Storage.thievesGuild.Mission04) == 3 then
		player:setStorageValue(Storage.thievesGuild.Mission04, 4)
	end

	return true
end
