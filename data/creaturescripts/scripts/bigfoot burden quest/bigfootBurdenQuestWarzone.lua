local boss = {
	["deathstrike"] = 2,
	["gnomevil"] = 3,
	["abyssador"] = 4,
}

function onKill(cid, target)
	if(boss[string.lower(getCreatureName(target))]) then
		if(getPlayerStorageValue(cid, 954) < boss[string.lower(getCreatureName(target))]) then
			setPlayerStorageValue(cid, 954, boss[string.lower(getCreatureName(target))])
		end
		setPlayerStorageValue(cid, 957 + boss[string.lower(getCreatureName(target))], 1)
	end
	return true
end