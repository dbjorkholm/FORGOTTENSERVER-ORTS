local config = {
	WallPositions = {
		[1] = Position({x=33241, y=31724, z=11}),
		[2] = Position({x=33241, y=31725, z=11}),
		[3] = Position({x=33241, y=31726, z=11}),
		[4] = Position({x=33241, y=31727, z=11}),
		[5] = Position({x=33241, y=31728, z=11}),
		[6] = Position({x=33241, y=31729, z=11}),
		[7] = Position({x=33241, y=31730, z=11}),
		[8] = Position({x=33241, y=31731, z=11}),
		[9] = Position({x=33241, y=31732, z=11})
	},
	walldown = 1526,
	wallup = 1049
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid == 1945 then
		for i = 1, #config["WallPositions"] do
			local tile = config["WallPositions"][i]:getTile()
			if tile then
				local thing = tile:getItemById(config["walldown"])
				if thing and thing:isItem() then
					Item(item.uid):transform(1946)
					thing:transform(config["wallup"])
				end
			end
		end	
	elseif itemEx.itemid == 1946 then
		for i = 1, #config["WallPositions"] do
			local tile = config["WallPositions"][i]:getTile()
			if tile then
				local thing = tile:getItemById(config["wallup"])
				if thing and thing:isItem() then
					Item(item.uid):transform(1945)
					thing:transform(config["walldown"])
				end
			end
		end
	else
		Player(cid):sendCancelMessage("Sorry, not possible.")
	end
	return true
end