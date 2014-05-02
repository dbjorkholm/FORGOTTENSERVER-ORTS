local config = {
	WallPositions = {
		[1] = Position({x=33226, y=31735, z=11}),
		[2] = Position({x=33227, y=31735, z=11}),
		[3] = Position({x=33228, y=31735, z=11}),
		[4] = Position({x=33229, y=31735, z=11}),
		[5] = Position({x=33230, y=31735, z=11}),
		[6] = Position({x=33231, y=31735, z=11}),
		[7] = Position({x=33232, y=31735, z=11}),
		[8] = Position({x=33233, y=31735, z=11}),
		[9] = Position({x=33234, y=31735, z=11}),
		[10] = Position({x=33235, y=31735, z=11}),
		[11] = Position({x=33236, y=31735, z=11}),
		[12] = Position({x=33237, y=31735, z=11}),
		[13] = Position({x=33238, y=31735, z=11})
	},
	walldown = 1524,
	wallup = 1050
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid == 1945 then
		for i = 1, #config["WallPositions"] do
			local tile = Tile(config["WallPositions"][i])
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
			local tile = Tile(config["WallPositions"][i])
			if tile then
				local thing = tile:getItemById(config["wallup"])
				if thing and thing:isItem() then
					Item(item.uid):transform(1945)
					thing:transform(config["walldown"])
				end
			end
		end
	else
		doPlayerSendCancel(cid,"Sorry, not possible.")
	end
	return true
end