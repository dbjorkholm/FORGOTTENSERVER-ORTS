function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid == 15358 and itemEx.actionid == 999 then
		doTeleportThing(cid, {x = 275, y = 616, z = 9})
		doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "As the small anchor resonates with the large anchor, you are transported right into a tiny room. You are not alone.")
		return true
	end
return false
end
