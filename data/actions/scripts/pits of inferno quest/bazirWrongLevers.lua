function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	if item.itemid == 1945 then
		player:teleportTo(Position(32806, 32328, 15))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		Item(item.uid):transform(1946)
 	end
 	return true
end
