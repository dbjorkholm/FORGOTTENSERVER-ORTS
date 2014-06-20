function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
    if player:getStorageValue(item.uid) ~= 1 then
		player:setStorageValue(item.uid, 1)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found a bag.")
		local bag = player:addItem(1987, 1)
		local items = {{2134}, {2147, 2}, {2145, 3}}
		for i = 1, #items do
			bag:addItem(items[i][1], items[i][2] or 1)
		end	
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "The wooden coffin is empty.")
	end
	return true
end