function onKill(cid, target)
	local targetMonster = Monster(target)
	if not targetMonster then
		return true
	end

	if targetMonster:getName():lower() ~= 'lizard magistratus' then
		return true
	end

	local player = Player(cid)
	if player:getStorageValue(Storage.WrathoftheEmperor.Mission06) >= 0 and player:getStorageValue(Storage.WrathoftheEmperor.Mission06) < 4 then
		player:setStorageValue(Storage.WrathoftheEmperor.Mission06, player:getStorageValue(Storage.WrathoftheEmperor.Mission06) + 1)
	end

	return true
end
