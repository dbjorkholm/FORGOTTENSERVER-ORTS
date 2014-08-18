local config = {
	[9118] = Position(32991, 31539, 4),
	[9119] = Position(32991, 31539, 1),
	[9121] = Position(32993, 31547, 4) -- levers in farmine
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local Elevatoruser = Tile(Position({x = toPosition.x - 1, y = toPosition.y, z = toPosition.z})):getTopCreature() -- get player who stand on the Startposition elevator

	Item(item.uid):transform(item.itemid == 1945 and 1946 or 1945)

	if Elevatoruser == nil or not Elevatoruser:isPlayer() then -- creature and player check
		return true
	end

	local lever = config[item.actionid]
	if lever and item.itemid == 1945 then
		Elevatoruser:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		Elevatoruser:teleportTo(lever)
		Position(lever):sendMagicEffect(CONST_ME_TELEPORT)

	-- if lever outdoor then select the farminestage
	elseif item.actionid == 9120 and item.itemid == 1945 then
		if Player(Elevatoruser):getStorageValue(Storage.TheNewFrontier.Mission05) == 7 then --if The New Frontier Quest "Mission 05: Getting Things Busy" complete then Stage 3
			Elevatoruser:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			local stage = Position(33061, 31527, 10)
			Elevatoruser:teleportTo(stage)
			Position(stage):sendMagicEffect(CONST_ME_TELEPORT)
			Item(item.uid):transform(1946)
			return true
		elseif Player(Elevatoruser):getStorageValue(Storage.TheNewFrontier.Mission03) == 3 then --if The New Frontier Quest "Mission 03: Strangers in the Night" complete then Stage 2
			Elevatoruser:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			local stage = Position(33061, 31527, 12)
			Elevatoruser:teleportTo(stage)
			Position(stage):sendMagicEffect(CONST_ME_TELEPORT)
			Item(item.uid):transform(1946)
			return true
		else --if nothing done Stage 1
			Elevatoruser:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			local stage = Position(33061, 31527, 14)
			Elevatoruser:teleportTo(stage)
			Position(stage):sendMagicEffect(CONST_ME_TELEPORT)
			Item(item.uid):transform(1946)
			return true
		end
	end
	return true
end