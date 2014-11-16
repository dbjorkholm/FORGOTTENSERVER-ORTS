function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if((itemEx.itemid == 7915 or itemEx.itemid == 7916) and itemEx.actionid == 100) then
		if item.itemid == 9744 and player:getStorageValue(Storage.InServiceofYalahar.MatrixState) < 1 then
			player:setStorageValue(Storage.InServiceofYalahar.MatrixState, 1)
			Item(item.uid):remove(1)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:say("The machine was activated.", TALKTYPE_MONSTER_SAY)
			player:setStorageValue(Storage.InServiceofYalahar.Questline, 46)
			player:setStorageValue(Storage.InServiceofYalahar.Mission08, 3) -- StorageValue for Questlog "Mission 08: Dangerous Machinations"
		elseif item.itemid == 9743 and player:getStorageValue(Storage.InServiceofYalahar.MatrixState) < 1 then
			player:setStorageValue(Storage.InServiceofYalahar.MatrixState, 2)
			Item(item.uid):remove(1)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:say("The machine was activated.", TALKTYPE_MONSTER_SAY)
			player:setStorageValue(Storage.InServiceofYalahar.Questline, 46)
			player:setStorageValue(Storage.InServiceofYalahar.Mission08, 3) -- StorageValue for Questlog "Mission 08: Dangerous Machinations"
		end
	end
	return true
end
