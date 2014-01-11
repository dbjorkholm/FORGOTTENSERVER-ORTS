function onUse(cid, item, fromPosition, itemEx, toPosition)

	local v1 = {x=33051, y=32099, z=6}
	local v2 = {x=33051, y=32099, z=7}

	if item.actionid == 9743 then
		doTeleportThing(cid,v1, TRUE)
		doCreatureSay(cid, "Zrrrt!", TALKTYPE_ORANGE_1)
		doSendMagicEffect(getCreaturePosition(cid),10)
		else
			if item.actionid == 9744 then
				doTeleportThing(cid,v2, TRUE)
				doCreatureSay(cid, "Zrrrt!", TALKTYPE_ORANGE_1)
				doSendMagicEffect(getCreaturePosition(cid),10)
			end
	end
end