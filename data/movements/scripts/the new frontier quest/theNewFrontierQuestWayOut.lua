
function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	if item.actionid == 8000 then
		if player:getStorageValue(Storage.TheNewFrontier.Questline) == 1 then
			player:setStorageValue(Storage.TheNewFrontier.Questline, 2)
			player:setStorageValue(Storage.TheNewFrontier.Mission01, 2) --Questlog, The New Frontier Quest "Mission 01: New Land"
			player:say("You have found the passage through the mountains and can report about your success.", TALKTYPE_ORANGE_1)
		end
	end
	return true
end