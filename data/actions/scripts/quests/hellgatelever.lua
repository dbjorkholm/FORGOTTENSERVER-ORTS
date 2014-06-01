function onUse(cid, item, fromPosition, itemEx, toPosition)
	--lever to create the bridge
	if item.actionid == 50027 then
		local bridgetile1 = Tile(Position({x = 32627, y = 31699, z = 10}))
		local bridgetile2 = Tile(Position({x = 32628, y = 31699, z = 10}))
		local bridgetile3 = Tile(Position({x = 32629, y = 31699, z = 10}))
			if item.itemid == 1945 then
				bridgetile1:getItemById(493):transform(5770)
				bridgetile2:getItemById(493):transform(5770)
				bridgetile3:getItemById(493):transform(5770)
				Item(item.uid):transform(1946)
			else
				bridgetile1:getItemById(5770):transform(493)
				bridgetile2:getItemById(5770):transform(493)
				bridgetile3:getItemById(5770):transform(493)
				Item(item.uid):transform(1945)
			end
	end
	return true
end