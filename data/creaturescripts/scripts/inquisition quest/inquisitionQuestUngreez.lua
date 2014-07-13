function onKill(cid, target)
local player = Player(cid)
	if(string.lower(getCreatureName(target)) == "ungreez") then
		if(player:getStorageValue(Storage.TheInquisition.Questline) == 18) then
			player:setStorageValue(Storage.TheInquisition.Questline, 19)
			player:setStorageValue(Storage.TheInquisition.Mission06, 2) -- The Inquisition Questlog- "Mission 6: The Demon Ungreez"
			player:say("You have slain Ungreez.", TALKTYPE_MONSTER_SAY)
		end
	end
	return true
end