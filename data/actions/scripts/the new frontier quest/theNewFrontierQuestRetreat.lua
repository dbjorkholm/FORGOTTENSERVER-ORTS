function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3156) then
		doTeleportThing(cid, {x = 33170, y = 31247, z = 11})
		doSendMagicEffect({x = 33170, y = 31247, z = 11}, CONST_ME_POFF)
	end
	return true
end