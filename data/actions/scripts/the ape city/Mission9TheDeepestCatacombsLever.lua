local config = {
	BanutaLeverPositions = {
		[1] = Position({x = 32891, y = 32590, z = 11}),
		[2] = Position({x = 32843, y = 32649, z = 11}),
		[3] = Position({x = 32808, y = 32613, z = 11}),
		[4] = Position({x = 32775, y = 32583, z = 11}),
		[5] = Position({x = 32756, y = 32494, z = 11}),
		[6] = Position({x = 32799, y = 32556, z = 11}),
		[7] = Position({x = 32862, y = 32557, z = 11})
	},
	wall1pos = Position({x = 32864, y = 32556, z = 11}),
	wall1ID = 3474,
	tile1ID = 3170,
	wall2pos = Position({x = 32865, y = 32556, z = 11}),
	wall2ID = 3475,
	tile2ID = 3167
}


function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid == 1945 and item.actionid == 12129 then
		Item(item.uid):transform(1946)
		addEvent(function() local tile = toPosition:getTile() if tile then local thing = tile:getItemById(1946) if thing and thing:isItem() then thing:transform(1945) end end end, 15 * 60 * 1000) -- 15 minutes until lever turn back
		
		for i = 1, #config["BanutaLeverPositions"] do
			local tile = config["BanutaLeverPositions"][i]:getTile()
			if tile then
				local thing = tile:getItemById(1946) --if all levers used
				if thing and thing:isItem() then
					AllBanutaLeversUsed = 1			--then status ok
				else
					AllBanutaLeversUsed = 0
					break
				end
			end
		end
		-- open gate when all levers used
		if AllBanutaLeversUsed == 1 then
				local tilewall1 = config["wall1pos"]:getTile()
				if tilewall1 then
					local thing = tilewall1:getItemById(config["wall1ID"])
					if thing and thing:isItem() then
						thing:transform(config["tile1ID"])
						addEvent(function() local tile = config["wall1pos"]:getTile() if tile then local thing = tile:getItemById(config["tile1ID"]) if thing and thing:isItem() then thing:transform(config["wall1ID"]) end end end, 15 * 60 * 1000) -- 15 minutes until wall turn back
					end
				end
				local tilewall2 = config["wall2pos"]:getTile()
				if tilewall2 then
					local thing = tilewall2:getItemById(config["wall2ID"])
					if thing and thing:isItem() then
						thing:transform(config["tile2ID"])
						addEvent(function() local tile = config["wall2pos"]:getTile() if tile then local thing = tile:getItemById(config["tile2ID"]) if thing and thing:isItem() then thing:transform(config["wall2ID"]) end end end, 15 * 60 * 1000)-- 15 minutes until wall turn back 
					end
				end
		end
	end
	return true
end
