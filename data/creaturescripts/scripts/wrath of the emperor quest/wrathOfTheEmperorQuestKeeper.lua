function onKill(cid, target)
	local monster = Monster(target)
	if monster then
		if string.lower(monster:getName()) == "the keeper" then
			Game.setStorageValue(8026, 0)
		end
	end
	return true
end