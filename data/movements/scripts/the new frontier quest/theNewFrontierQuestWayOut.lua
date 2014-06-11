function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	local player = Player(cid)
	if not player then
		return true
	end
	local TheNewFrontierQuestStorage = 12144 --TheNewFrontierQuestline_Storage
	if item.actionid == 8000 then
		if player:getStorageValue(TheNewFrontierQuestStorage) == 1 then
			player:setStorageValue(TheNewFrontierQuestStorage, 2)
			player:setStorageValue(12131, 2) --Questlog, The New Frontier Quest "Mission 01: New Land"
			player:say("You have found the passage through the mountains and can report about your success.", TALKTYPE_ORANGE_1)
		end
	end
	return true
end