local boss = {
	["splasher"] = Storage.InServiceofYalahar.QuaraSplasher,
	["sharptooth"] = Storage.InServiceofYalahar.QuaraSharptooth,
	["inky"] = Storage.InServiceofYalahar.QuaraInky,
}

function onKill(cid, target)
	if(boss[string.lower(getCreatureName(target))]) then
		local player = Player(cid)
		if(player:getStorageValue(boss[string.lower(getCreatureName(target))]) < 1) then
			player:setStorageValue(boss[string.lower(getCreatureName(target))], 1)
			player:say("You slained " .. getCreatureName(target) .. ".", TALKTYPE_ORANGE_1)
			player:setStorageValue(Storage.InServiceofYalahar.QuaraState, 2)
			player:setStorageValue(Storage.InServiceofYalahar.Questline, 41)
			player:setStorageValue(Storage.InServiceofYalahar.Mission07, 4) -- StorageValue for Questlog "Mission 07: A Fishy Mission"
		end
	end
	return true
end