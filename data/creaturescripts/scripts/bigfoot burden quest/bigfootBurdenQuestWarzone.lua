local boss = {
	["deathstrike"] = {2},
	["gnomevil"] = {3},
	["abyssador"] = {4}
}

function onKill(cid, target, lastHit)
	local creature = Creature(target)
	local targetName = boss[creature:getName():lower()]
	
	if not targetName then
		return true
	end
	
	for id, damage in pairs(creature:getDamageMap()) do
		local player = Player(id)
		if player then
			if player:getStorageValue(945) < targetName[1] then
				player:setStorageValue(945, targetName[1])
			end
			
			player:setStorageValue(956 + targetName[1], 1)
		end
	end
	return true
end