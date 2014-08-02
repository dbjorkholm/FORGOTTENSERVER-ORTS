local bosses = {
	['deathstrike'] = 2,
	['gnomevil'] = 3,
	['abyssador'] = 4
}

function onKill(cid, target, lastHit)
	local targetMonster = Monster(target)
	if not targetMonster then
		return true
	end

	local bossValue = bosses[targetName:getName():lower()]
	if not bossValue then
		return true
	end

	for pid, _ in pairs(targetMonster:getDamageMap()) do
		local attackerPlayer = Player(pid)
		if attackerPlayer then
			if attackerPlayer:getStorageValue(945) < bossValue then
				attackerPlayer:setStorageValue(945, bossValue)
			end

			attackerPlayer:setStorageValue(956 + bossValue, 1)
		end
	end
end