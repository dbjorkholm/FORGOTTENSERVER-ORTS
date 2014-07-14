local chests = {
	[9008] = {itemid = 2495, count = 1},
	[9009] = {itemid = 8905, count = 1},
	[9010] = {itemid = 16111, count = 1},
	[9011] = {itemid = 16112, count = 1}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if chests[item.uid] then
		local player = Player(cid)
		if player:getStorageValue(Storage.DemonOak.Done) ~= 2 then
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'It\'s empty.')
			return true
		end

		local chest = chests[item.uid]
		local itemType = ItemType(chest.itemid)
		if itemType then
			local article = itemType:getArticle()
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found ' .. (#article > 0 and article .. ' ' or '') .. itemType:getName() .. '.')
		end

		player:addItem(chest.itemid, chest.count)
		player:setStorageValue(Storage.DemonOak.Done, 3)
	end

	return true
end
