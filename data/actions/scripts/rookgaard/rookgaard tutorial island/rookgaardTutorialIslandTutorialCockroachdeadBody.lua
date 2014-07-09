function onUse(cid, item, fromPosition, itemEx, toPosition)
	local owner = Item(item.uid):getAttribute(ITEM_ATTRIBUTE_CORPSEOWNER)
	if owner ~= nil and Player(owner) and cid ~= owner then
		return
	end

	local player = Player(cid)
	if player:getStorageValue(Storage.RookgaardTutorialIsland.cockroachBodyMsgStorage) ~= 1 then
		player:sendTutorial(9)
		player:setStorageValue(Storage.RookgaardTutorialIsland.cockroachBodyMsgStorage, 1)
	end
end	