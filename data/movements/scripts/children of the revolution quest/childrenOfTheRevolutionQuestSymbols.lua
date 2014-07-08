function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	if item.uid == 3166 then
		if player:getStorageValue(Storage.ChildrenoftheRevolution.StrangeSymbols) < 1 and player:getStorageValue(Storage.ChildrenoftheRevolution.Mission03) >= 2 then
			player:setStorageValue(Storage.ChildrenoftheRevolution.StrangeSymbols, 1)
			player:setStorageValue(Storage.ChildrenoftheRevolution.Mission04, 2) --Questlog, Children of the Revolution "Mission 4: Zze Way of Zztonezz"
			player:say("A part of the floor before you displays an arrangement of strange symbols.", TALKTYPE_ORANGE_1)
		end
	end
	return true
end
