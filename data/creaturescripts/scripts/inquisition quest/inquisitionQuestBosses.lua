local bosses = {
	["ushuriel"] = 200,
	["zugurosh"] = 201,
	["madareth"] = 202,
	["latrivan"] = 203,
	["golgordan"] = 203,
	["annihilon"] = 204,
	["hellgorak"] = 205
}

function onKill(cid, target)
	if(bosses[string.lower(getCreatureName(target))]) then
		if(string.lower(getCreatureName(target)) == "latrivan" or string.lower(getCreatureName(target)) == "golgordan") then	
			setGlobalStorageValue(bosses[string.lower(getCreatureName(target))], getGlobalStorageValue(bosses[string.lower(getCreatureName(target))]) < 1 and 1 or 2)
			if(getGlobalStorageValue(bosses[string.lower(getCreatureName(target))]) == 2) then
				doCreatureSay(cid, "You now have 3 minutes to exit this room through the teleporter. It will bring you to the next room.", TALKTYPE_MONSTER_SAY)
				addEvent(setGlobalStorageValue, 3 * 60 * 1000, bosses[string.lower(getCreatureName(target))], 0)
			end
			return true
		end
		doCreatureSay(cid, "You now have 3 minutes to exit this room through the teleporter. It will bring you to the next room.", TALKTYPE_MONSTER_SAY)
		setGlobalStorageValue(bosses[string.lower(getCreatureName(target))], 2)
		addEvent(setGlobalStorageValue, 3 * 60 * 1000, bosses[string.lower(getCreatureName(target))], 0)
	end
	return true
end