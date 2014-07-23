local config = {
	BridgePositions = {
		[1] = Position({x = 32627, y = 31699, z = 10}),
		[2] = Position({x = 32628, y = 31699, z = 10}),
		[3] = Position({x = 32629, y = 31699, z = 10})
	},
	bridgeID = 5770,
	waterID = 493
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid == 1945 then
		for i = 1, #config["BridgePositions"] do
			local tile = config["BridgePositions"][i]:getTile()
			if tile then
				local thing = tile:getItemById(config["waterID"])
				if thing and thing:isItem() then
					Item(item.uid):transform(1946)
					thing:transform(config["bridgeID"])
				end
			end
		end	
	elseif itemEx.itemid == 1946 then
		for i = 1, #config["BridgePositions"] do
			local tile = config["BridgePositions"][i]:getTile()
			if tile then
				local thing = tile:getItemById(config["bridgeID"])
				if thing and thing:isItem() then
					Item(item.uid):transform(1945)
					thing:transform(config["waterID"])
				end
			end
		end
	else
		Player(cid):sendCancelMessage("Sorry, not possible.")
	end
	return true
end
