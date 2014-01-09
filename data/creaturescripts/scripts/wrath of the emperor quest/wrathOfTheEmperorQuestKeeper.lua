function onKill(cid, target)
	if(string.lower(getCreatureName(target)) == "the keeper") then	
		setGlobalStorageValue(8026, 0)
	end
	return true
end