local tree = {
	Position(32857, 32231, 11),
	Position(32857, 32232, 11),
	Position(32857, 32233, 11)
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	if item.uid == 9234 then
		player:teleportTo(Position(32819, 32347, 9))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		for i = 1, #tree do
			if Tile(tree[i]):getItemById(2722) == 0 then
				Game.createItem(2722, 1, tree[i])
				tree[i]:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			end
		end
	end
	return true
end
			
