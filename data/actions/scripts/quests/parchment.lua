function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(item.actionid) ~= 1 then
		player:setStorageValue(item.actionid, 1)
		player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a bag.')
		local bag = player:addItem(1987, 1)
		if bag then
			local items = { {2165}, {2151, 2}, {2230}, {2229}, {1948} }
			for i = 1, #items do
				bag:addItem(items[i][1], items[i][2] or 1)
			end
			
			local key = bag:addItem(2091, 1)
			if key then
				key:setActionId(6010)
			end
		end
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR,  'The ' .. ItemType(item.itemid):getName() .. ' is empty.')
	end
	return true
end
