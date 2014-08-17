function onKill(cid, target)
	local targetMonster = Monster(target)
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'lizard noble' then
		return true
	end

	local player = Player(cid)
	local storage = player:getStorageValue(Storage.WrathoftheEmperor.Mission07)
	if storage >= 0 and storage < 6 then
		player:setStorageValue(Storage.WrathoftheEmperor.Mission07, math.max(1, storage) + 1)
	end

	return true
end
