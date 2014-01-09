function onStepIn(cid, item, position, lastPosition)
	if(getPlayerItemCount(cid, 1970) >= 1) then
		if(item.uid == 2001) then
			doTeleportThing(cid, {x = 32791, y = 32327, z = 10})
			doSendMagicEffect({x = 32791, y = 32327, z = 10}, CONST_ME_TELEPORT)
		elseif(item.uid == 2000) then
			doTeleportThing(cid, {x = 32791, y = 32331, z = 10})
			doSendMagicEffect({x = 32791, y = 32331, z = 10}, CONST_ME_TELEPORT)
		end
	else
		doTeleportThing(cid, lastPosition)
	end
	return true
end