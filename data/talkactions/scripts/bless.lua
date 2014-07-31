function onSay(cid, words, param)
	local player = Player(cid)
	local totalPrice = getBlessingsCost(player:getLevel()) * 5
	if not(isPlayerPzLocked(cid)) then
		if player:hasBlessing(1) and player:hasBlessing(2) and player:hasBlessing(3) and player:hasBlessing(4) and player:hasBlessing(5) then
			player:sendCancelMessage("You have already been blessed by the gods.")
			return false
		end
		if player:removeMoney(totalPrice) then
			for b = 1, 5 do
				player:addBlessing(b)
			end
			player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You have been blessed by the five gods!")
		else
			player:sendCancelMessage("You need ".. totalPrice .." gold coins to buy all 5 bless.")
		end
	else
		player:sendCancelMessage("You can't buy bless, when you are in a battle.")
	end
	return false
end
