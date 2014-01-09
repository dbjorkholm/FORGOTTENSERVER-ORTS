function onStepIn(cid, item, pos, fromPosition)
	if (isPlayer(cid)) then
		if item.uid == 9238 then
			doTeleportThing(cid, {x=33456,y=31346,z=8})
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_WATERSPLASH)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You dive into the vortex to swim below the rocks to the other side of the cave.")	
		elseif item.uid == 9239 then
			doTeleportThing(cid, {x=33199,y=31978,z=8})
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_WATERSPLASH)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You dive into the vortex to swim below the rocks to the other side of the cave.")
		end
	end
	return TRUE
end
