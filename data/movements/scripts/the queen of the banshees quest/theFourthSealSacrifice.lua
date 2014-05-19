local pos = {
	{x = 32242, y = 31893, z = 14},
	{x = 32243, y = 31893, z = 14},
	{x = 32242, y = 31891, z = 14},
	{x = 32243, y = 31891, z = 14}
}

function onAddItem(moveitem, tileitem, position)
	if moveitem.itemid == 2006 then
		local Tile = Position({x = 32243, y = 31892, z = 14}):getTile()
		if Tile then
			local thing = Tile:getItemById(2006, 2)
			if thing and thing:isItem() then
				Item(moveitem.uid):transform(2016, 2)
				for i = 1, #pos do
					Position(pos[i]):sendMagicEffect(CONST_ME_DRAWBLOOD)
				end
			end
		end
	end
	return true
end