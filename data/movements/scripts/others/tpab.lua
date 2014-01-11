function onStepIn(cid, item, pos)
local barcu = {x = 32726, y = 31666, z = 6}
local centre = {x = 32667, y = 31681, z = 6}
local centre2 = {x = 32664, y = 31679, z = 6}
local centre3 = {x = 32655, y = 31688, z = 6}
local sota = {x = 32658, y = 31688, z = 8}
local muntanya = {x = 32674, y = 31617, z = 6}
	if item.actionid == 9700 then
		doTeleportThing(cid,centre)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
	end
	if item.actionid == 9701 then
		doTeleportThing(cid,barcu)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
	end
	if item.actionid == 9702 then
		doTeleportThing(cid,muntanya)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
	end
	if item.actionid == 9703 then
		doTeleportThing(cid,centre2)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
	end
	if item.actionid == 9704 then
		doTeleportThing(cid,sota)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
	end
	if item.actionid == 9705 then
		doTeleportThing(cid,centre3)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
	end
end