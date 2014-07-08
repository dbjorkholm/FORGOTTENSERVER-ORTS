function onStepIn(cid, item, position, fromPosition)
	if (isPlayer(cid)) then
		if (item.actionid == 9117) then
			if (getPlayerStorageValue(cid, 10017) == 1) then
				doTeleportThing(cid, {x=32360, y=31781, z=9})
				doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
				setPlayerStorageValue(cid, 10017, 0)
			elseif (getPlayerStorageValue(cid, 10018) == 1) then
				doTeleportThing(cid, {x=32369, y=32242, z=6})
				doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
				setPlayerStorageValue(cid, 10018, 0)
			elseif (getPlayerStorageValue(cid, 10019) == 1) then
				doTeleportThing(cid, {x=32958, y=32077, z=5})
				doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
				setPlayerStorageValue(cid, 10019, 0)
			elseif (getPlayerStorageValue(cid, 10020) == 1) then
				doTeleportThing(cid, {x=32681, y=31686, z=2})
				doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
				setPlayerStorageValue(cid, 10020, 0)
			elseif (getPlayerStorageValue(cid, 10021) == 1) then
				doTeleportThing(cid, {x=32646, y=31925, z=11})
				doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
				setPlayerStorageValue(cid, 10021, 0)
			elseif (getPlayerStorageValue(cid, 10022) == 1) then
				doTeleportThing(cid, {x=33230, y=32392, z=5})
				doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
				setPlayerStorageValue(cid, 10022, 0)
			elseif (getPlayerStorageValue(cid, 10023) == 1) then
				doTeleportThing(cid, {x=33130, y=32815, z=4})
				doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
				setPlayerStorageValue(cid, 10023, 0)
			elseif (getPlayerStorageValue(cid, 10024) == 1) then
				doTeleportThing(cid, {x=33266, y=31835, z=9})
				doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
				setPlayerStorageValue(cid, 10024, 0)
			elseif (getPlayerStorageValue(cid, 10025) == 1) then
				doTeleportThing(cid, {x=32337, y=32837, z=8})
				doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
				setPlayerStorageValue(cid, 10025, 0)
			elseif (getPlayerStorageValue(cid, 10026) == 1) then
				doTeleportThing(cid, {x=32628, y=32743, z=4})
				doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
				setPlayerStorageValue(cid, 10026, 0)
			elseif (getPlayerStorageValue(cid, 10027) == 1) then
				doTeleportThing(cid, {x=32213, y=31132, z=8})
				doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
				setPlayerStorageValue(cid, 10027, 0)
			elseif (getPlayerStorageValue(cid, 10028) == 1) then
				doTeleportThing(cid, {x=32786, y=31245, z=5})
				doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
				setPlayerStorageValue(cid, 10028, 0)
			else
				doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
				doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
			end
		end
	end
	return true
end	 