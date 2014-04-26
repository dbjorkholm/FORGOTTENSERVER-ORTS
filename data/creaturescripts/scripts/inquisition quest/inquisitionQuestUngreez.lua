function onKill(cid, target)
local player = Player(cid)
	if(string.lower(getCreatureName(target)) == "ungreez") then
		if(player:getStorageValue(200) == 18) then
			player:setStorageValue(200, 19)
			player:setStorageValue(12116, 2) -- The Inquisition Questlog- "Mission 6: The Demon Ungreez"
			player:say("You have slain Ungreez.", TALKTYPE_ORANGE_1)
		end
	end
	return true
end