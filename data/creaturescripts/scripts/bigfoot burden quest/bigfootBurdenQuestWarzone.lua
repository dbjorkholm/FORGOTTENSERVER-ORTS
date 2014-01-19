local boss = {
    ["deathstrike"] = 2,
    ["gnomevil"] = 3,
    ["abyssador"] = 4
}

function onDeath(cid, corpse, lastHitKiller, mostDamageKiller, lastHitUnjustified, mostDamageUnjustified)
	local creature = Creature(cid)
	local damageMap = creature:getDamageMap()
	local v = boss[getCreatureName(cid):lower()]
 
	for id, damage in pairs(damageMap) do
		local player = Player(id)
		if v then
			if player:getStorageValue(945) < v then
				player:setStorageValue(954, v)
			end
		
			player:setStorageValue(956 + v, 1)
		end
	end
end