function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if not player:hasOutfit(player:getSex() == 0 and 431 or 430) then 
		if player:getItemCount(13540) > 0 and player:getItemCount(13541) > 0 and player:getItemCount(13542) > 0 and player:getItemCount(13543) > 0 and player:getItemCount(13544) > 0 and player:getItemCount(13545) > 0 then
			for i = 13540, 13545 do
				player:removeItem(i, 1)
			end
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have received the Afflicted outfit!")
			player:addOutfit(430)
			player:addOutfit(431)
			player:getPosition():sendMagicEffect(CONST_ME_HOLYDAMAGE)
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have all required items!")
		end
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already obtained this outfit!")
	end
	return true
end
