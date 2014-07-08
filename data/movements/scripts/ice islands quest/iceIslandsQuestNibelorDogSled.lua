local config = {
	[12025] = {x = 32407, y = 31067, z = 7},
	[12026] = {x = 32365, y = 31059, z = 7},
	[12027] = {x = 32329, y = 31045, z = 7},
	[12028] = {x = 32301, y = 31080, z = 7}
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	local sled = config[item.uid]
	if not sled then
		return true
	end
	-- Nibelor 5: Cure the Dogs needed or Barbarian Test Quest needed
	if ((item.uid == 12025 or item.uid == 12026) and player:getStorageValue(Storage.TheIceIslands.Mission06) == 8) or ((item.uid == 12027 or item.uid == 12028) and player:getStorageValue(Storage.BarbarianTest.Mission03) == 3) then 
		if player:getItemCount(2671) >= 1 then --if ham then
			player:removeItem(2671, 1)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(sled)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		end
	end
	return true
end