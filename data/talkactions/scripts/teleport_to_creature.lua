function onSay(cid, words, param)

	local target = Creature(param)
	local tile = string.split(param, ",")
	local pos = {x = 0, y = 0, z = 0}
	
	local player = Player(cid)
	if not player:getGroup():getAccess() then
		return true
	end
	
	if target ~= nil then
		player:teleportTo(target:getPosition())
	elseif(tile[1] ~= 0 and tile[2] ~= 0) then
		pos = {x = tile[1], y = tile[2], z = tile[3]}
		player:teleportTo(pos)
	else
		player:sendCancelMessage("Cannot be Possible.")
	end
	return true
end
