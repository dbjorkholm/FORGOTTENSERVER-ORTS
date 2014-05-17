local t = {
	[50011] = {{x = 32636, y = 31881, z = 7}, {x = 32636, y = 31881, z = 2}, effect = true},
	[50012] = {{x = 32636, y = 31881, z = 2}, {x = 32636, y = 31881, z = 7}, effect = true}
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