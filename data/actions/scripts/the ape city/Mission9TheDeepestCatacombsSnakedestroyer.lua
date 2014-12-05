function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not target:isItem() then
		return false
	end

	if target.itemid == 4861 and target.actionid == 12130 and player:getStorageValue(Storage.TheApeCity.Mission09) == 1 then -- destroy cobra statue
		target:transform(4862)
		target:decay()
		toPosition:sendMagicEffect(CONST_ME_POFF)
		player:setStorageValue(Storage.TheApeCity.Mission09, 2) -- The Ape City Questlog - Mission 9: The Deepest Catacombs
		player:setStorageValue(Storage.TheApeCity.Questline, 22)
	elseif target.itemid == 4996 then -- destroy large amphora
		target:transform(4997)
		target:decay()
		toPosition:sendMagicEffect(CONST_ME_POFF)
	end
	return true
end
