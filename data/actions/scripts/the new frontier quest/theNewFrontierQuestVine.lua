function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3153) then
		doTeleportThing(cid, {x = getThingPosition(item.uid).x - 4, y = getThingPosition(item.uid).y, z = getThingPosition(item.uid).z - 3})
		doSendMagicEffect({x = getThingPosition(item.uid).x - 4, y = getThingPosition(item.uid).y, z = getThingPosition(item.uid).z - 3} , CONST_ME_POFF)
	elseif(item.uid == 3154) then
		doTeleportThing(cid, {x = getThingPosition(item.uid).x + 4, y = getThingPosition(item.uid).y, z = getThingPosition(item.uid).z + 3})
		doSendMagicEffect({x = getThingPosition(item.uid).x + 4, y = getThingPosition(item.uid).y, z = getThingPosition(item.uid).z + 3} , CONST_ME_POFF)
	end
	return true
end