local pharaohs = {
	['omruc'] = Storage.TheAncientTombs.Omruc,
	['thalas'] = Storage.TheAncientTombs.Thalas,
	['dipthrah'] = Storage.TheAncientTombs.Diphtrah,
	['mahrdis'] = Storage.TheAncientTombs.Mahrdis,
	['vashresamun'] = Storage.TheAncientTombs.Vashresamun,
	['morguthis'] = Storage.TheAncientTombs.Morguthis,
	['rahemos'] = Storage.TheAncientTombs.Rahemos,
	['ashmunrah'] = Storage.TheAncientTombs.Ashmunrah
}

function onKill(cid, target)
	local target = Creature(target)
	local pharaohStorage = pharaohs[target:getName():lower()]
	if not pharaohStorage then
		return true
	end

	local player = Player(cid)
	Game.setStorageValue(pharaohStorage, 1)
	addEvent(setGlobalStorageValue, 3 * 60 * 1000, pharaohStorage, 0)
	player:say('You now have 3 minutes to exit this room through the teleporter. It will bring you to the reward room.', TALKTYPE_MONSTER_SAY)
	return true
end
