local boss = {
	["Energy Overlord"] = {storage = 10001, global = 8568},
	["Fire Overlord"] = {storage = 10001, global = 8569}, 
	["Ice Overlord"] = {storage = 10001, global = 8570},
	["Earth Overlord"] = {storage = 10001, global = 8578},
	["Lord of the Elements"] = {}
}

function onKill(cid, target)
	local t = boss[getCreatureName(target)]
	if(t ~= nil) then
		if (t.global ~= nil) then
			setGlobalStorageValue(t.global, 0)
		end
		if (t.storage ~= nil) then
			if (getPlayerStorageValue(cid, t.storage) < 1) then
				setPlayerStorageValue(cid, t.storage, 1)
			end
		end
		doCreatureSay(cid, "You slained " .. getCreatureName(target) .. ".", TALKTYPE_MONSTER_SAY)
	end
	return true
end