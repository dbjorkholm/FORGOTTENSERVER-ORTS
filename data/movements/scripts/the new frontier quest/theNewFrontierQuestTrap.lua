function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if(item.actionid == 8007) then
		setPlayerStorageValue(cid, 1015, 23)
		doTeleportThing(cid, {x = 33170, y = 31253, z = 11})
		doSendMagicEffect({x = 33170, y = 31253, z = 11}, CONST_ME_POFF)
		doCreatureSay(cid, "So far for the negotiating peace. Now you have other problems to handle.", TALKTYPE_ORANGE_1)
	end
	return true
end