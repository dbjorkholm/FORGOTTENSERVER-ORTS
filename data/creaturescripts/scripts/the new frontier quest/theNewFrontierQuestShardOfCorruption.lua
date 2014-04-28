function onKill(cid, target)
	local monster = Monster(target)
	local player = Player(cid)
	if monster then
		if string.lower(monster:getName()) == "shard of corruption" then
			if player:getStorageValue(1015) == 12 then
				player:setStorageValue(1015, 13)
			end
		end
	end
	return true
end