local t = {
	[9118] = {{x=32991, y=31539, z=1}, {x=32991, y=31539, z=4}, effect = true}, --last
	[9119] = {{x=32991, y=31539, z=4}, {x=32991, y=31539, z=1}, effect = true},
	[9120] = {{x=32993, y=31547, z=4}, {x=33061, y=31527, z=10}, effect = true},
	[9121] = {{x=33061, y=31527, z=10}, {x=32993, y=31547, z=4}, effect = true}
	--[5505] = {{x=33055, y=31527, z=10}, {x=33055, y=31527, z=10}, effect = false}
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