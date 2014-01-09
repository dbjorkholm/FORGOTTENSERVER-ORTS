function onStepIn(cid, item, position, fromPosition)
	if (isPlayer(cid)) then
		if (item.uid == 9056) then
			doPlayerSetTown(cid, 4)
		elseif (item.uid == 9057) then
			doPlayerSetTown(cid, 2)
		elseif (item.uid == 9058) then
			doPlayerSetTown(cid, 1)
		elseif (item.uid == 9059) then
			doPlayerSetTown(cid, 5)
		elseif (item.uid == 9060) then
			doPlayerSetTown(cid, 3)
		elseif (item.uid == 9061) then
			doPlayerSetTown(cid, 10)
		elseif (item.uid == 9062) then
			doPlayerSetTown(cid, 9)
		elseif (item.uid == 9063) then
			doPlayerSetTown(cid, 11)
		elseif (item.uid == 9064) then
			doPlayerSetTown(cid, 7)
		elseif (item.uid == 9065) then
			doPlayerSetTown(cid, 8)
		elseif (item.uid == 9066) then
			doPlayerSetTown(cid, 12)
		elseif (item.uid == 9067) then
			doPlayerSetTown(cid, 13)
		elseif (item.uid == 9068) then
			doPlayerSetTown(cid, 14)
			doTeleportThing(cid, {x=33023,y=31522,z=11})
			doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You are now a citizen of "..getTownName(getPlayerTown(cid))..".")	
		return true
		elseif (item.uid == 9240) then
			doPlayerSetTown(cid, 28)
		end
	doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
	doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
	doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You are now a citizen of "..getTownName(getPlayerTown(cid))..".")	
	end
	return true
end