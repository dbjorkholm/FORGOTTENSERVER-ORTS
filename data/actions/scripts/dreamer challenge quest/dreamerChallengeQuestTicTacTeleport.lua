function onUse(cid, item, fromPosition, itemEx, toPosition)
	
	local o1 = Tile(Position(32845, 32264, 14))
	local o2 = Tile(Position(32843, 32266, 14))
	local o3 = Tile(Position(32843, 32268, 14))
	local o4 = Tile(Position(32845, 32268, 14))
	local o5 = Tile(Position(32844, 32267, 14))
	local o6 = Tile(Position(32840, 32269, 14))
	local x1 = Tile(Position(32841, 32269, 14))
	local x2 = Tile(Position(32840, 32268, 14))
	local x3 = Tile(Position(32842, 32267, 14))
	
	local o = 2639
	local x = 2638
	
	if item.itemid == 1945 then
		if o1:getItemById(o) and o2:getItemById(o) and o3:getItemById(o) and o4:getItemById(o) and o5:getItemById(o) and o6:getItemById(o) then
			if x1:getItemById(x) and x2:getItemById(x) and x3:getItemById(x) then
				o1:getItemById(o):remove()
				o2:getItemById(o):remove()
				o3:getItemById(o):remove()
				o4:getItemById(o):remove()
				o5:getItemById(o):remove()
				o6:getItemById(o):remove()
				x1:getItemById(x):remove()
				x2:getItemById(x):remove()
				x3:getItemById(x):remove()
					
				local crack = Tile(Position(32836, 32288, 14)):getItemById(6299)
				if crack ~= 0 then
					crack:remove()
					local item = Game.createItem(1387, 1, Position(32836, 32288, 14))
					if item then
						item:setActionId(9032)
					end
				end
			end
		end
	end
	Item(item.uid):transform(item.itemid == 1945 and 1946 or 1945)
	return true
end