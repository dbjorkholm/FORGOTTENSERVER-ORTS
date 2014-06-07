local config = {
	[12025] = {x = 32407, y = 31067, z = 7},
	[12026] = {x = 32365, y = 31059, z = 7}
}

function onStepIn(cid, item, position, lastPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	local sled = config[item.uid]
	if not sled then
		return true
	end
	if player:getItemCount(2671) >= 1 then --if ham then
		player:removeItem(2671, 1)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(sled)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "You don't have Ham for the dogs.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
	end
	return true
end