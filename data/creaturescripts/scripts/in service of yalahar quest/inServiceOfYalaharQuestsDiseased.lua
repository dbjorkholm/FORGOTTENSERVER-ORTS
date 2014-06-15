local boss = {
	["diseased dan"] = Storage.InServiceofYalahar.DiseasedDan,
	["diseased bill"] = Storage.InServiceofYalahar.DiseasedBill,
	["diseased fred"] = Storage.InServiceofYalahar.DiseasedFred,
}

function onKill(cid, target)
	if(boss[string.lower(getCreatureName(target))]) then
		local player = Player(cid)
		if(player:getStorageValue(boss[string.lower(getCreatureName(target))]) < 1) then
			player:setStorageValue(boss[string.lower(getCreatureName(target))], 1)
			player:say("You slained " .. getCreatureName(target) .. ".", TALKTYPE_ORANGE_1)
		end
	end
	return true
end