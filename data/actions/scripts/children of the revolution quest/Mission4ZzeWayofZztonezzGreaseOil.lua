function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.actionid == 8013 then
		local player = Player(cid)
		if player:getStorageValue(Storage.ChildrenoftheRevolution.Questline) == 13 then
			player:setStorageValue(Storage.ChildrenoftheRevolution.Questline, 14)
			player:setStorageValue(Storage.ChildrenoftheRevolution.Mission04, 4) --Questlog, Children of the Revolution "Mission 4: Zze Way of Zztonezz"
			Item(item.uid):remove()
			player:say("Due to being extra greasy, the leavers can now be moved.", TALKTYPE_MONSTER_SAY)
		end
	end
	return true
end