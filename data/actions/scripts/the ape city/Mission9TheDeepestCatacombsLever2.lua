local config = {
	wall1pos = Position({x = 32864, y = 32556, z = 11}),
	wall1ID = 3474,
	tile1ID = 3170,
	wall2pos = Position({x = 32865, y = 32556, z = 11}),
	wall2ID = 3475,
	tile2ID = 3167
}


function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid == 1945 and item.uid == 12131 then
		Item(item.uid):transform(1946)
		addEvent(function() local tile = toPosition:getTile() if tile then local thing = tile:getItemById(1946) if thing and thing:isItem() then thing:transform(1945) end end end, 1 * 60 * 1000) -- 1 minutes until lever turn back
		local tilewall1 = config["wall1pos"]:getTile()
		if tilewall1 then
			local thing = tilewall1:getItemById(config["wall1ID"])
			if thing and thing:isItem() then
				thing:transform(config["tile1ID"])
				addEvent(function() local tile = config["wall1pos"]:getTile() if tile then local thing = tile:getItemById(config["tile1ID"]) if thing and thing:isItem() then thing:transform(config["wall1ID"]) end end end, 1 * 60 * 1000) -- 1 minutes until wall turn back
			end
		end
		local tilewall2 = config["wall2pos"]:getTile()
		if tilewall2 then
			local thing = tilewall2:getItemById(config["wall2ID"])
			if thing and thing:isItem() then
				thing:transform(config["tile2ID"])
				addEvent(function() local tile = config["wall2pos"]:getTile() if tile then local thing = tile:getItemById(config["tile2ID"]) if thing and thing:isItem() then thing:transform(config["wall2ID"]) end end end, 1 * 60 * 1000)-- 1 minutes until wall turn back 
			end
		end
	end
	return true
end
