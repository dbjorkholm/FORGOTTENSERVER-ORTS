local config = {
	[39511] = {Position(32739, 32392, 14), Position(32739, 32391, 14)},
	[39512] = {Position(32739, 32391, 14), Position(32739, 32392, 14)}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	local targetItem = config[item.actionid]
	if not targetItem then
		return true
	end

	local tile = targetItem[1]:getTile()
	if tile then
		local thing = tile:getTopTopItem()
		if thing and thing:getId(6434) then
			if targetItem[1] = 39512 then
				player:teleportTo(Position(32717, 32388, 13))
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			end
			thing:moveTo(targetItem[2])
		end
	end
	return true
end
