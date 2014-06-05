local config = {
	[23698] = {23701, {x = 32869, y = 31312, z = 11}},
	[23699] = {23700, {x = 32881, y = 31312, z = 11}}
}

function onStepIn(cid, item, position, lastPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	
	local machines = config[item.actionid]
	if not machines then
		return true
	end
	if Game.getStorageValue(machines[1]) == 1 then 
		player:getPosition():sendMagicEffect(CONST_ME_ENERGYHIT)
		player:teleportTo(machines[2])
		player:getPosition():sendMagicEffect(CONST_ME_ENERGYHIT)
	else
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "The machines are not activated.")
	end
	return true
end