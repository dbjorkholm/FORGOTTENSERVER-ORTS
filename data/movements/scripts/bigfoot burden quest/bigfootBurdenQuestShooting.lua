local function doCreateDummy(cid, pos)
	local player = Player(cid)
	local tile = Tile(pos)

	if player:getStorageValue(902) < 5 then
		if tile:getItemById(18226) then
			tile:getItemById(18226):remove()
		elseif tile:getItemById(18227) then
			tile:getItemById(18227):remove()
		end
		pos:sendMagicEffect(CONST_ME_POFF)
		local dumdum = math.random(18226, 18227)
		Game.createItem(dumdum, 1, pos)
	elseif getPlayerStorageValue(cid, 902) == 5 then
		if tile:getItemById(18226) then
			tile:getItemById(18226):remove()
		elseif tile:getItemById(18227) then
			tile:getItemById(18227):remove()
		end
		-- Commenting away mayNotMove since this function no longer exists.
		-- mayNotMove(cid, false)
		player:setStorageValue(900, 9)
	end
	return addEvent(doCreateDummy, 2 * 1000, cid, pos)
end

function onStepIn(cid, item, position, lastPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	if player:getStorageValue(900) == 8 then
		player:setStorageValue(902, 0)
		-- Commenting away mayNotMove since this function no longer exists.
		-- mayNotMove(cid, true)
		doCreateDummy(cid, {x = player:getPosition().x, y = player:getPosition().y - 5, z = 10})
		position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	else
		player:teleportTo(lastPosition)
	end
	return true
end
