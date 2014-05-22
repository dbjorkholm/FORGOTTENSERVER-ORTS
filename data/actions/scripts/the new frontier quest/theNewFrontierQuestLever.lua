local t = {
	[8005] = {{x = 33065, y = 31489, z = 15}, {x = 33055, y = 31527, z = 10}, effect = true},
	[8006] = {{x = 33055, y = 31527, z = 10}, {x = 33065, y = 31489, z = 15}, effect = true}
}
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
	local k = t[item.actionid]
	local thing = getTopCreature(k[1]).uid
	if(k and item.itemid == 1945) then
		if(isPlayer(thing)) then
			doTeleportThing(thing, k[2], false)
			if(k.effect) then
				doSendMagicEffect(k[2], CONST_ME_TELEPORT)
			end
		end
	end
	return doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)
end