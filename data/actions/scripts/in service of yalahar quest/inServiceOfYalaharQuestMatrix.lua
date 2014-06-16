function onUse(cid, item, fromPosition, itemEx, toPosition)
	if((itemEx.itemid == 7915 or itemEx.itemid == 7916) and itemEx.actionid == 100) then
		local player = Player(cid)
		if item.itemid == 9744 and player:getStorageValue(Storage.InServiceofYalahar.MatrixState) < 1 then
			player:setStorageValue(Storage.InServiceofYalahar.MatrixState, 1)
			doRemoveItem(item.uid, 1)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
			player:say("The machine was activated.", TALKTYPE_ORANGE_1)
			player:setStorageValue(Storage.InServiceofYalahar.Questline, 46)
			player:setStorageValue(Storage.InServiceofYalahar.Mission08, 3) -- StorageValue for Questlog "Mission 08: Dangerous Machinations"
		elseif item.itemid == 9743 and player:getStorageValue(Storage.InServiceofYalahar.MatrixState) < 1 then
			player:setStorageValue(Storage.InServiceofYalahar.MatrixState, 2)
			doRemoveItem(item.uid, 1)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
			player:say("The machine was activated.", TALKTYPE_ORANGE_1)
			player:setStorageValue(Storage.InServiceofYalahar.Questline, 46)
			player:setStorageValue(Storage.InServiceofYalahar.Mission08, 3) -- StorageValue for Questlog "Mission 08: Dangerous Machinations"
		end
	end
	return true
end