function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if not player:hasOutfit(430) and not player:hasOutfit(431) then 
		if player:getItemCount(13540) >= 1 and player:getItemCount(13541) >= 1 and player:getItemCount(13542) >= 1 and player:getItemCount(13543) >= 1 and player:getItemCount(13544) >= 1 and player:getItemCount(13545) >= 1 then
			for i = 13540, 13545 do
				player:removeItem(i, 1)
			end
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You've received the Afflicted addon!")
			player:addOutfit(430)
			player:addOutfit(431)
			player:getPosition():sendMagicEffect(CONST_ME_HOLYDAMAGE)
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have all required items!")
		end
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You've already obtained this addon!")
	end
	return true
end