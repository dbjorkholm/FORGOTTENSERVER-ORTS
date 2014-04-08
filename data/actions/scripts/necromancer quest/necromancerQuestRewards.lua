function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 1410 and item.actionid == 2000 and item.uid == 2226) then
		local p = Player(cid)
		if(p:getStorageValue(321) < 1) then
			p:setStorageValue(321, 1)
			local id = {2536, 2436, 2656}
			local bag = p:addItem(1987, 1)
			local c = Container(bag:getUniqueId())
			for i = 1, #id do
				c:addItem(id[i], 1)
			end
			p:sendTextMessage(MESSAGE_INFO_DESCR, "You've found a bag.")
		else
			p:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
return true
end
