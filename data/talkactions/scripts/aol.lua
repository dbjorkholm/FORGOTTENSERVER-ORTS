function onSay(cid, words, param)
	local cost, p = 50000, Player(cid)
	if(not(p:isPzLocked())) then
		if(p:removeMoney(cost)) then
			p:addItem(2173, 1)
			p:sendTextMessage(MESSAGE_INFO_DESCR, "You have bought amulet of loss!")        
		else
			p:sendCancelMessage("You need "..cost.." gold coins to buy amulet of loss.")
		end
	else
		p:sendCancelMessage("You can't buy amulet of loss, when you are in a battle.")
	end
return false
end
