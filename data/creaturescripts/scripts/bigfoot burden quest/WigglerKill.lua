function onKill(cid, target)
	local targetMonster = Monster(target)
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'wiggler' then
		return true
	end

	local player = Player(cid)
	local value = player:getStorageValue(937)
	if value < 10 and player:getStorageValue(936) == 1 then
		player:setStorageValue(937, value + 1)
	end
	return true
end