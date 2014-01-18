function onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)
	if (player:getStorageValue(5556) <= 0) then
		player:setStorageValue(5556,1)
		player:addItem(2463,1)
	else
		return false
	end
end