function onUse(cid, item, fromPosition, itemEx, toPosition)
	local pool = Tile(Position(32878, 32270, 14))
	local life = Tile(Position(32881, 32267, 14))
	local death = Tile(Position(32881, 32273, 14))
	local fire = Tile(Position(32884, 32270, 14))
	local portal = Position(32881, 32270, 14)

        if item.itemid == 1945 then
                if(pool:getItemById(2025) == 0 or life:getItemById(2168) == 0 or death:getItemById(6300) == 0 or fire:getItemById(1487) == 0) then
                        return false
                end
                local stone = Tile(portal):getItemById(1355)
                if stone ~= 0 then
			stone:remove()
                        local item = Game.createItem(1387, 1, portal)
			item:setActiondId(9031)
                end
                Tile(Position(32874, 32263, 14)):getItemById(3729):transform(3733)
                Tile(Position(32875, 32263, 14)):getItemById(3730):transform(3734)
                Tile(Position(32874, 32264, 14)):getItemById(3731):transform(3735)
                Tile(Position(32875, 32264, 14)):getItemById(3732):transform(3736)
                pool:getItemById(2025):remove()
                life:getItemById(2168):remove()
                death:getItemById(6300):remove()
                fire:getItemById(1487):remove()
	end
	Item(item.uid):transform(item.itemid == 1945 and 1946 or 1945)
        return true
end
