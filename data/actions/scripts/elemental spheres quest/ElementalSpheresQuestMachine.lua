local config = {
	[1] = Position(33183, 32197, 13),
	[2] = Position(33331, 32076, 13),
	[3] = Position(33265, 32202, 13),
	[4] = Position(33087, 32096, 13)
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if isInArray({7911, 7912}, item.itemid) then
		local player = Player(cid)
		if isInArray({33268, 33269}, toPosition.x) and toPosition.y == 31830 and toPosition.z == 10 and player:getStorageValue(10002) >= 20 then
			local vocation = player:getVocation():getId()
			if vocation > 4 then
				vocation = vocation - 4
			end
			player:setStorageValue(10002, player:getStorageValue(10002) - 20)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(config[vocation], false)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		end
		toPosition.x = toPosition.x + (item.itemid == 7911 and 1 or -1)
		local tile = toPosition:getTile()
		if tile then
			local thing = tile:getItemById(item.itemid == 7911 and 7912 or 7911)
			if thing then
				thing:transform(thing:getId() + 4)
			end
		end
		Item(item.uid):transform(item.itemid + 4)
	else
		toPosition.x = toPosition.x + (item.itemid == 7915 and 1 or -1)
		local tile = toPosition:getTile()
		if tile then
			local thing = tile:getItemById(item.itemid == 7915 and 7916 or 7915)
			if thing then
				thing:transform(thing:getId() - 4)
			end
		end
		Item(item.uid):transform(item.itemid - 4)
	end	
	return true
end