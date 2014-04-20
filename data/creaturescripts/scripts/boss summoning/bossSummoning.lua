local pharaoh = {
	["omruc"] = 12101,
	["thalas"] = 12102,
	["dipthrah"] = 12103,
	["mahrdis"] = 12104,
	["vashresamun"] = 12105,
	["morguthis"] = 12106,
	["rahemos"] = 12107
}

function onKill(cid, target)
	if(pharaoh[string.lower(getCreatureName(target))]) then
		local player = Player(cid)
		local t = Creature(target)
		Game.setStorageValue(pharaoh[string.lower(t:getName())], 1)
		addEvent(setGlobalStorageValue, 3 * 60 * 1000, pharaoh[string.lower(t:getName())], 0)
		player:say("You now have 3 minutes to exit this room through the teleporter. It will bring you to the reward room.", TALKTYPE_ORANGE_1)
	end
	return true
end
