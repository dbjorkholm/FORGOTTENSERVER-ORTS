function onKill(cid, target)
	local targetMonster = Monster(target)
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'lizard noble' then
		return true
	end

	local player = Player(cid)
	if player:getStorageValue(Storage.WrathoftheEmperor.Mission07) >= 0 and player:getStorageValue(Storage.WrathoftheEmperor.Mission07) < 6 then
		player:setStorageValue(Storage.WrathoftheEmperor.Mission07, player:getStorageValue(Storage.WrathoftheEmperor.Mission07) + 1)
	end

	return true
end
