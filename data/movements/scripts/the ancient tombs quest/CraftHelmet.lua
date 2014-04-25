function onAddItem(moveitem, tileitem, position)
	if(moveitem.itemid == 2335)or(moveitem.itemid == 2336)or(moveitem.itemid == 2337)or(moveitem.itemid == 2338)or(moveitem.itemid == 2339)or(moveitem.itemid == 2340)or(moveitem.itemid == 2341)then
		local tile = Tile(position)
		if tile:getItemById(2335) and tile:getItemById(2336) and tile:getItemById(2337) and tile:getItemById(2338) and tile:getItemById(2339) and tile:getItemById(2340) and tile:getItemById(2341) then
			Game.createItem(2342, 1, position)
			tile:getItemById(2335):remove(1)
			tile:getItemById(2336):remove(1)
			tile:getItemById(2337):remove(1)
			tile:getItemById(2338):remove(1)
			tile:getItemById(2339):remove(1)
			tile:getItemById(2340):remove(1)
			tile:getItemById(2341):remove(1)
			position:sendMagicEffect(CONST_ME_FIREAREA)
		end
	end
	return true
end