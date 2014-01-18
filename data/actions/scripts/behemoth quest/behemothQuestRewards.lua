function onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)
	if(player:getStorageValue(10010) < 1) then
		player:addExperience(75000, true, true)
		player:setStorageValue(10010, 1)
	end
	return true
end