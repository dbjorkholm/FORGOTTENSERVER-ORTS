function onUse(cid, item, fromPosition, itemEx, toPosition)
	if math.random(6) == 1 then
		fromPosition:sendMagicEffect(CONST_ME_POFF)
		Item(item.uid):transform(2115)

		local player = Player(cid)
		player:addItem(ITEM_GOLD_COIN, 1)

		local cStorage = player:getStorageValue(Storage.Achievements.AllowanceCollector)
		if cStorage < 50 then
			player:setStorageValue(Storage.Achievements.AllowanceCollector, math.max(1, cStorage) + 1)
		elseif cStorage == 50 then
			player:addAchievement('Allowance Collector')
			player:setStorageValue(Storage.Achievements.AllowanceCollector, 51)
		end
	else
		fromPosition:sendMagicEffect(CONST_ME_SOUND_YELLOW)
		Player(cid):addItem(ITEM_PLATINUM_COIN, 1)
	end
	return true
end