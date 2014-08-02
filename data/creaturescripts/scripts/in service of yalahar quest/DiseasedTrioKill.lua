local diseasedTrio = {
	['diseased bill'] = Storage.InServiceofYalahar.DiseasedBill,
	['diseased dan']  = Storage.InServiceofYalahar.DiseasedDan,
	['diseased fred'] = Storage.InServiceofYalahar.DiseasedFred
}

function onKill(cid, target)
	local targetMonster = Monster(target)
	if not targetMonster then
		return true
	end

	local bossStorage = diseasedTrio[targetMonster:getName():lower()]
	if not bossStorage then
		return true
	end

	local player = Player(cid)
	if player:getStorageValue(bossStorage) < 1 then
		player:setStorageValue(bossStorage, 1)
		player:say('You slayed ' .. targetMonster:getName() .. '.', TALKTYPE_MONSTER_SAY)
	end
	return true
end