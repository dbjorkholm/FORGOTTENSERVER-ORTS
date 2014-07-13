function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	if item.uid == 3163 then
		if player:getStorageValue(Storage.ChildrenoftheRevolution.Questline) == 4 then
			player:setStorageValue(Storage.ChildrenoftheRevolution.Questline, 5)
			player:setStorageValue(Storage.ChildrenoftheRevolution.Mission01, 2) --Questlog, Children of the Revolution "Mission 1: Corruption"
			player:say("The temple has been corrupted and is lost. Zalamon should be informed about this as soon as possible.", TALKTYPE_MONSTER_SAY)
		end
	end
	return true
end
