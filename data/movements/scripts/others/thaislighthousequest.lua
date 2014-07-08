function onStepIn(cid, item, position, fromPosition)
	--stairs appear if stepon stone tile
	if item.actionid == 50025 then
		local stairstile = Tile(Position({x = 32225, y = 32282, z = 9}))
		stairstile:getItemById(424):transform(8280)
		Item(item.uid):transform(425)
	--the created portal
	elseif item.actionid == 50026 then
		local player = Player(cid)
		if not player then
			return true
		end
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo({x = 32225, y = 32274, z = 10})
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end

	--stairs disappear if stepout stone tile
function onStepOut(cid, item, position, fromPosition)
	if item.actionid == 50025 then
		local stairstile = Tile(Position({x = 32225, y = 32282, z = 9}))
		stairstile:getItemById(8280):transform(424)
		Item(item.uid):transform(426)
	end
	return true
end