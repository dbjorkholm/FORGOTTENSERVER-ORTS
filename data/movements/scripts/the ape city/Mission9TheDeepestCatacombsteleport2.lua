local config = {
	AmphorasPositions = {
		[1] = Position({x = 32792, y = 32527, z = 10}),
		[2] = Position({x = 32823, y = 32525, z = 10}),
		[3] = Position({x = 32876, y = 32584, z = 10}),
		[4] = Position({x = 32744, y = 32586, z = 10})
	},
	brokenAmphoraId = 4997
}


function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	if item.uid == 12130 then
		for i = 1, #config["AmphorasPositions"] do
			local tile = config["AmphorasPositions"][i]:getTile()
			if tile then
				local thing = tile:getItemById(config["brokenAmphoraId"])
				if thing and thing:isItem() then
					Amphorasbroken = 1
				else
					Amphorasbroken = 0
					break
				end
			end
		end
		if Amphorasbroken == 1 then
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo({x = 32885, y = 32632, z = 11})
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		else
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo({x = 32852, y = 32544, z = 10})
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "There are 4 Large Amphoras that must be broken in order to open the teleporter.")
		end
	end
	return true
end


