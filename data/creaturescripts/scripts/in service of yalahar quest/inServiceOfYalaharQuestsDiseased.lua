local boss = {
	["diseased dan"] = 25,
	["diseased bill"] = 24,
	["diseased fred"] = 23,
}

function onKill(cid, target)
	if(boss[string.lower(getCreatureName(target))]) then
		if(getPlayerStorageValue(cid, boss[string.lower(getCreatureName(target))]) < 1) then
			setPlayerStorageValue(cid, boss[string.lower(getCreatureName(target))], 1)
			doCreatureSay(cid, "You slained " .. getCreatureName(target) .. ".", TALKTYPE_ORANGE_1)
		end
	end
	return true
end