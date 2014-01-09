local cost = 50000
function onSay(cid, words, param)
	if isPlayerPzLocked(cid) == FALSE then
		if doPlayerRemoveMoney(cid,cost) then
			doPlayerAddItem(cid, 2173, 1) 
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have bought amulet of loss!")	
		else
			doPlayerSendCancel(cid,"You need "..cost.." gold coins to buy amulet of loss.")
		end
	else
		doPlayerSendCancel(cid,"You can't buy amulet of loss, when you are in a battle.")
	end
	return false
end