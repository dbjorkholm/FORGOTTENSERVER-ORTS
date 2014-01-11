function onStepIn(cid, item, pos)
local dungeon = {x = 33290, y = 31786, z = 13}
local gatev = {x = 32834, y = 32082, z = 7}
local gatea = {x = 32680, y = 31720, z = 7}
local gatet = {x = 32268, y = 32162, z = 7}
local gatec = {x = 32263, y = 31847, z = 7}
local gatee = {x = 33221, y = 31921, z = 7}
local gatek = {x = 32574, y = 31981, z = 7}
	if item.actionid == 9710 and (getGlobalStorageValue(9710) == 1) then
		if getPlayerLevel(cid) >= 60 then
			doTeleportThing(cid,dungeon)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREAREA)
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have to be at least level 60 to enter this gate.")
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
			doTeleportThing(cid,gatev)
		end
	end
	if item.actionid == 9711 and (getGlobalStorageValue(9711) == 1) then
		if getPlayerLevel(cid) >= 60 then
			doTeleportThing(cid,dungeon)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREAREA)
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have to be at least level 60 to enter this gate.")
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
			doTeleportThing(cid,gatea)
		end
	end
	if item.actionid == 9712 and (getGlobalStorageValue(9712) == 1) then
		if getPlayerLevel(cid) >= 60 then
			doTeleportThing(cid,dungeon)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREAREA)
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have to be at least level 60 to enter this gate.")
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
			doTeleportThing(cid,gatet)
		end
	end
	if item.actionid == 9713 and (getGlobalStorageValue(9713) == 1) then
		if getPlayerLevel(cid) >= 60 then
			doTeleportThing(cid,dungeon)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREAREA)
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have to be at least level 60 to enter this gate.")
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
			doTeleportThing(cid,gatec)
		end
	end
	if item.actionid == 9714 and (getGlobalStorageValue(9714) == 1) then
		if getPlayerLevel(cid) >= 60 then
			doTeleportThing(cid,dungeon)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREAREA)
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have to be at least level 60 to enter this gate.")
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
			doTeleportThing(cid,gatee)
		end
	end
	if item.actionid == 9716 and (getGlobalStorageValue(9716) == 1) then
		if getPlayerLevel(cid) >= 60 then
			doTeleportThing(cid,dungeon)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREAREA)
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have to be at least level 60 to enter this gate.")
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
			doTeleportThing(cid,gatek)
		end
	end
	if item.actionid == 9715 and (getGlobalStorageValue(9714) == 1) then
		doTeleportThing(cid,gatee)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREAREA)
	end
	if item.actionid == 9715 and (getGlobalStorageValue(9716) == 1) then
		doTeleportThing(cid,gatek)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREAREA)
	end
	if item.actionid == 9715 and (getGlobalStorageValue(9713) == 1) then
		doTeleportThing(cid,gatec)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREAREA)
	end
	if item.actionid == 9715 and (getGlobalStorageValue(9712) == 1) then
		doTeleportThing(cid,gatet)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREAREA)
	end
	if item.actionid == 9715 and (getGlobalStorageValue(9711) == 1) then
		doTeleportThing(cid,gatea)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREAREA)
	end
	if item.actionid == 9715 and (getGlobalStorageValue(9710) == 1) then
		doTeleportThing(cid,gatev)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREAREA)
	end
	
end