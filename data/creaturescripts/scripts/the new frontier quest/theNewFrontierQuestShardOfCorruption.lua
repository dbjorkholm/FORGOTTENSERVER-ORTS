function onKill(cid, target)
	if(isMonster(target)) then
		if(string.lower(getCreatureName(target)) == "shard of corruption") then
			if(getPlayerStorageValue(cid, 1015) == 12) then
				setPlayerStorageValue(cid, 1015, 13)
			end
		end
	end
	return true
end