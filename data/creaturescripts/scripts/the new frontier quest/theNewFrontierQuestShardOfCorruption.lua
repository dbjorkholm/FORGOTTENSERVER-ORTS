dofile('data/lib/StorageValues.lua')
function onKill(cid, target)
	local monster = Monster(target)
	local player = Player(cid)
	if monster then
		if string.lower(monster:getName()) == "shard of corruption" then
			if player:getStorageValue(TheNewFrontier.Questline) == 12 then
				player:setStorageValue(TheNewFrontier.Questline, 13)
				player:setStorageValue(TheNewFrontier.Mission04, 2) --Questlog, The New Frontier Quest "Mission 04: The Mine Is Mine"
			end
		end
	end
	return true
end