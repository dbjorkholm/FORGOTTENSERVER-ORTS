local config = { 
    message = "Azerus ran into teleporter! It will disappear in 2 minutes. Enter It!", 
    timeToRemove = 180 -- seconds
}

local function removal(position)
	position.stackpos = 1
	if (getThingfromPos(position).itemid == 1387) then
		doRemoveItem(getThingfromPos(position).uid)
	end
	return TRUE
end

function onKill(cid, target)
	if(isMonster(target) and string.lower(getCreatureName(target)) == "azerus") then
		doCreateTeleport(1387, {x=32780, y=31168, z=14}, { x = 32783, y = 31168, z = 10 })
		doCreatureSay(target, config.message, TALKTYPE_MONSTER_SAY, 0, 0, { x = 32783, y = 31168, z = 10 })
		addEvent(removal, config.timeToRemove * 1000, { x = 32783, y = 31168, z = 10 })
	end
	return true
end