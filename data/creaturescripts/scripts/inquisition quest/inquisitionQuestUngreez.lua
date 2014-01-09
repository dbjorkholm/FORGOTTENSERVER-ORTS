function onKill(cid, target)
	if(string.lower(getCreatureName(target)) == "ungreez") then
		if(getPlayerStorageValue(cid, 200) == 18) then
			setPlayerStorageValue(cid, 200, 19)
			doCreatureSay(cid, "You have slain Ungreez.", TALKTYPE_ORANGE_1)
		end
	end
	return true
end