dofile('data/lib/StorageValues.lua')
function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if item.itemid == 4183 then --reward
		if player:getStorageValue(TheApeCity.Mission06) == 1 then
			player:setStorageValue(TheApeCity.Mission06, 2) -- The Ape City Questlog - Mission 6: Witches' Cap Spot
			player:addItem(4840, 1)
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found a Witches Cap Spot.")
		end
	end
	return true
end
