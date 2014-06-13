
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.actionid == 12128 then
	local player = Player(cid)
			if player:getStorageValue(Storage.TheApeCity.Mission08) == 1 then
				player:setStorageValue(Storage.TheApeCity.Mission08, 2) -- The Ape City Questlog - Mission 8: Looking for a hair of holy ape
				player:addItem(4843, 1)
				player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found a Giant Ape's Hair.")
			end
	end
	return true
end
