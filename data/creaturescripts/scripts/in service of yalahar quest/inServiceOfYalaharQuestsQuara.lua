local boss = {
	["splasher"] = 13,
	["sharptooth"] = 12,
	["inky"] = 11,
}

function onKill(cid, target)
	if(boss[string.lower(getCreatureName(target))]) then
		if(getPlayerStorageValue(cid, boss[string.lower(getCreatureName(target))]) < 1) then
			setPlayerStorageValue(cid, boss[string.lower(getCreatureName(target))], 1)
			doCreatureSay(cid, "You slained " .. getCreatureName(target) .. ".", TALKTYPE_ORANGE_1)
			setPlayerStorageValue(cid, 14, 2)
			setPlayerStorageValue(cid, 30, 41)
			Player(cid):setStorageValue(12018, 4) -- StorageValue for Questlog "Mission 07: A Fishy Mission"
		end
	end
	return true
end