--local bosses = {
--	["thalas"] = {pos = {x = 33396, y = 32838, z = 14}, delay = 4 * 60 * 1000, uid = 1},
--	["morguthis"] = {pos = {x = 33166, y = 32694, z = 14}, delay = 4 * 60 * 1000, uid = 2},
--	["rahemos"] = {pos = {x = 33078, y = 32781, z = 14}, delay = 4 * 60 * 1000, uid = 3},
--	["diptrah"] = {pos = {x = 33095, y = 32590, z = 15}, delay = 4 * 60 * 1000, uid = 4},
--	["vashresamun"] = {pos = {x = 33123, y = 32656, z = 15}, delay = 4 * 60 * 1000, uid = 5},
--	["mahrdis"] = {pos = {x = 33191, y = 32953, z = 15}, delay = 4 * 60 * 1000, uid = 6},
--	["omruc"] = {pos = {x = 33201, y = 33001, z = 14}, delay = 1 * 60, uid = 7},
--	["ashmunrah"] = {pos = {x = 33179, y = 32884, z = 11}, delay = 5 * 60 * 1000, uid = 8},
--	["hellgorak"] = {pos = {x = 33104, y = 31726, z = 11}, delay = 6 * 60 * 1000, uid = 9},
--	["ushuriel"] = {pos = {x = 33171, y = 31728, z = 11}, delay = 6 * 60 * 1000, uid = 10},
--	["madareth"] = {pos = {x = 33197, y = 31758, z = 11}, delay = 6 * 60 * 1000, uid = 11},
--	["golgordan"] = {pos = {x = 33237, y = 31278, z = 11}, delay = 6 * 60 * 1000, uid = 12},
--	["latrivan"] = {pos = {x = 33227, y = 31278, z = 11}, delay = 6 * 60 * 1000, uid = 13},
--	["annihilon"] = {pos = {x = 33197, y = 31690, z = 11}, delay = 6 * 60 * 1000, uid = 14},
--	["zugurosh"] = {pos = {x = 33136, y = 31692, z = 11}, delay = 6 * 60 * 1000, uid = 15},
--}
--
--local function doSummonBoss(name, pos, delay)
--	setGlobalStorageValue(20000 + bosses[name].uid, -1)
--end
--
--function onKill(cid, target)
--	targetName = string.lower(getCreatureName(target))
--	if(bosses[targetName]) then
--		if(getGlobalStorageValue(20000 + bosses[targetName].uid) < 1) then
--			setGlobalStorageValue(20000 + bosses[targetName].uid, 1)
--			addEvent(doSummonBoss, bosses[targetName].delay, targetName, bosses[targetName].pos, bosses[targetName].delay)
--		end
--	end
--	return true
--end
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
			setGlobalStorageValue(pharaoh[string.lower(getCreatureName(target))], 1)
			addEvent(setGlobalStorageValue, 3 * 60 * 1000, pharaoh[string.lower(getCreatureName(target))], 0)
			player:say("You now have 3 minutes to exit this room through the teleporter. It will bring you to the reward room.", TALKTYPE_ORANGE_1)
	end
	return true
end
