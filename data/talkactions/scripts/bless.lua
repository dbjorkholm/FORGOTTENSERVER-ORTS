function onSay(cid, words, param)
	local p = Player(cid)
	local cost = getBlessingsCost(getPlayerLevel(cid))
	if(not(isPlayerPzLocked(cid))) then
		if(p:hasBlessing(1) and p:hasBlessing(2) and p:hasBlessing(3) and p:hasBlessing(4) and p:hasBlessing(5)) then
			p:sendCancelMessage("You have already been blessed by the gods.")
			return false
		end
		if(p:removeMoney(cost)) then
			for b = 1,5 do
				p:addBlessing(b)
			end
			p:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
			p:sendTextMessage(MESSAGE_INFO_DESCR, "You have been blessed by the 5 gods!")
		else
			p:sendCancelMessage("You need "..cost.." gold coins to buy all 5 bless.")
		end
	else
		p:sendCancelMessage("You can't buy bless, when you are in a battle.")
	end
return false
end
