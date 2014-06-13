local pharaoh = {
	["omruc"] = Storage.TheAncientTombs.Omruc,
	["thalas"] = Storage.TheAncientTombs.Thalas,
	["dipthrah"] = Storage.TheAncientTombs.Diphtrah,
	["mahrdis"] = Storage.TheAncientTombs.Mahrdis,
	["vashresamun"] = Storage.TheAncientTombs.Vashresamun,
	["morguthis"] = Storage.TheAncientTombs.Morguthis,
	["rahemos"] = Storage.TheAncientTombs.Rahemos,
	["ashmunrah"] = Storage.TheAncientTombs.Ashmunrah
}

function onKill(cid, target)
	local t = Creature(target)
	if(pharaoh[string.lower(t:getName())]) then
		local player = Player(cid)
		Game.setStorageValue(pharaoh[string.lower(t:getName())], 1)
		addEvent(setGlobalStorageValue, 3 * 60 * 1000, pharaoh[string.lower(t:getName())], 0)
		player:say("You now have 3 minutes to exit this room through the teleporter. It will bring you to the reward room.", TALKTYPE_ORANGE_1)
	end
	return true
end
