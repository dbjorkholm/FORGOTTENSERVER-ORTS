local function doCreateDummy(cid, pos)
	local player = Player(cid)

	if player:getStorageValue(902) < 5 then
		if Tile(pos):getItemById(18226) > 0 then
			Item(item.uid):removeItem(Tile(pos):getItemById(18226), 1)
		elseif Tile(pos):getItemById(18227) > 0 then
			Item(item.uid):removeItem(Tile(pos):getItemById(18227), 1)
		end
		toPosition():sendMagicEffect(CONST_ME_POFF)
		Game.createItem(math.random(18226, 18227), 1, pos)
	elseif getPlayerStorageValue(cid, 902) == 5 then
		if Tile(pos):getItemById(18226) > 0 then
			Item(item.uid):removeItem(Tile(pos):getItemById(18226), 1)
		elseif Tile(pos):getItemById(18227) > 0 then
			Item(item.uid):removeItem(Tile(pos):getItemById(18227), 1)
		end
		-- Commenting away mayNotMove since this function no longer exists.
		-- mayNotMove(cid, false)
		player:setStorageValue(900, 9)
	end
	return addEvent(doCreateDummy, 2 * 1000, cid, pos)
end

function onStepIn(cid, item, position, lastPosition)
	local player = Player(cid)

	if item.actionid == 8030 then
		if player:getStorageValue(900) == 8 then
			player:setStorageValue(902, 0)
			-- Commenting away mayNotMove since this function no longer exists.
			-- mayNotMove(cid, true)
			doCreateDummy(cid, {x = player:getPosition().x, y = player:getPosition().y - 5, z = 10})
			toPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		else
			player:teleportTo(lastPosition)
		end
	end
	return true
end
