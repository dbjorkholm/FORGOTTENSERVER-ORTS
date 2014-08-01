local function doPlayerAddPremiumPoints(cid, ppoints)
	db.query('UPDATE znote_accounts SET points=points+'.. ppoints ..' WHERE account_id=' .. getAccountNumberByPlayerName(getCreatureName(cid)))
end 

function onUse(cid, item, fromPosition, itemEx, toPosition) 
	doPlayerAddPremiumPoints(cid, 30)
	doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have received 30 shop points to your account.")
	doSendMagicEffect(getCreaturePosition(cid), 28)
	doRemoveItem(item.uid,1)
	return true
end