function onSay(cid, words, param)
	local cost = getBlessingsCost(getPlayerLevel(cid))
	if (isPlayerPzLocked(cid) == FALSE) then
		if (getPlayerBlessing(cid, 1) and getPlayerBlessing(cid, 2) and getPlayerBlessing(cid, 3) and getPlayerBlessing(cid, 4) and getPlayerBlessing(cid, 5)) then
			doPlayerSendCancel(cid,"You have already been blessed by the gods.")
			return false
		end
		if (doPlayerRemoveMoney(cid,cost)) then
			doPlayerAddBlessing(cid, 1)
			doPlayerAddBlessing(cid, 2)
			doPlayerAddBlessing(cid, 3)
			doPlayerAddBlessing(cid, 4)
			doPlayerAddBlessing(cid, 5)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYAREA)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have been blessed by the 5 gods!")
		else
			doPlayerSendCancel(cid,"You need "..cost.." gold coins to buy all 5 bless.")
		end
	else
		doPlayerSendCancel(cid,"You can't buy bless, when you are in a battle.")
	end
	return false
end