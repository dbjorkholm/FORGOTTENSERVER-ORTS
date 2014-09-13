function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid ~= 1225 then
		return true
	end

	local player = Player(cid)
	if player:getStorageValue(Storage.OutfitQuest.NightmareOutfit) >= 1 or player:getStorageValue(Storage.OutfitQuest.BrotherhoodOutfit) >= 1 then
		player:teleportTo(toPosition, true)
		Item(item.uid):transform(1226)
	end
	return true
end