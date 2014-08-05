local bosses = {
	['ushuriel'] = 200,
	['zugurosh'] = 201,
	['madareth'] = 202,
	['latrivan'] = 203,
	['golgordan'] = 203,
	['annihilon'] = 204,
	['hellgorak'] = 205
}

function onKill(cid, target)
	local targetMonster = Monster(target)
	if not targetMonster then
		return true
	end

	local targetName = targetMonster:getName():lower()
	local bossStorage = bosses[targetName]
	if not bossStorage then
		return true
	end

	local newValue = 2
	if targetName == 'latrivan' or targetName == 'golgordan' then
		newValue = math.max(0, getGlobalStorageValue(bossStorage)) + 1
	end
	setGlobalStorageValue(bossStorage, newValue)

	if newValue == 2 then
		Player(cid):say('You now have 3 minutes to exit this room through the teleporter. It will bring you to the next room.', TALKTYPE_MONSTER_SAY)
		addEvent(setGlobalStorageValue, 3 * 60 * 1000, bossStorage, 0)
	end
	return true
end