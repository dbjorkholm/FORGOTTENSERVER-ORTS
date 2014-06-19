function onUse(cid, item, fromPosition, itemEx, toPosition)

	local storage = 60994
	local player = Player(cid)

	if player:getStorageValue(storage) < 1 then
		player:setStorageValue(storage, 1)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found a bag.")
		local bag = player:addItem(1987, 1)
		bag:addItem(2165, 1)
		bag:addItem(2151, 2)
		bag:addItem(2230, 1)
		bag:addItem(2229, 1)
		bag:addItem(1948, 1)
		local key = bag:addItem(2091, 1)
		key:setActionId(6010)
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "The coffin is empty.")
	end
	return true
end
