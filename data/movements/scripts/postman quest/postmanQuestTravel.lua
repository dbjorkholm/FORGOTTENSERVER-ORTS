local travel = {
	[7840] = {1, "You visited Carlin. Now head to Edron."},
	[7842] = {2, "You visited Edron. Now head to Venore."},
	[7843] = {3, "You visited Venore. Now head to Cormaya."},
	[7844] = {4, "You visited Cormaya. Now head to the Kevin's Post Office."},
}

function onStepIn(cid, item, position, lastPosition)
	if(getPlayerStorageValue(cid, 250 + travel[item.actionid][1]) < 1) then
		setPlayerStorageValue(cid, 250 + travel[item.actionid][1], 1)
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, travel[item.actionid][2])
		doSendMagicEffect(CONST_ME_MAGIC_BLUE)
	end
	return true
end