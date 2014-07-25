local function doCreateDummy(cid, pos)
	local player = Player(cid)
	if not player then
		return true
	end
	
	local tile = Tile(pos)
	if tile then
		local thing = tile:getTopVisibleThing()
		if thing and isInArray({18226, 18227}, thing:getId()) then
			thing:remove()
		end
	end

	if player:getStorageValue(902) < 5 then
		pos:sendMagicEffect(CONST_ME_POFF)
		Game.createItem(math.random(18226, 18227), 1, pos)
	elseif player:getStorageValue(902) == 5 then
		player:setStorageValue(900, 9)
		return false
	end
	
	return addEvent(doCreateDummy, 2 * 1000, cid, pos)
end

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	
	if player:getStorageValue(900) == 8 then
		player:setStorageValue(902)
		local playerPos = player:getPosition()
		doCreateDummy(cid, Position(playerPos.x, playerPos.y - 5, 10))
		position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	else
		player:teleportTo(fromPosition)
	end
	return true
end