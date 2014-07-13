function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	
	if item.itemid == 1945 then
		player:teleportTo(32806, 32328, 15)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		Item(item.uid):transform(1946)
 	end
 	return true
end
