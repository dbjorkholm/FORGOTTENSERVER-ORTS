function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.actionid == 7804) then
		local player = Player(cid)
		if(player:getStorageValue(Storage.InServiceofYalahar.Questline) >= 41) then
			if(item.itemid == 1257) then
				player:teleportTo(toPosition, true)
				doTransformItem(item.uid, 1258)
			elseif(item.itemid == 9177) then
				player:teleportTo(toPosition, true)
				doTransformItem(item.uid, 9178)
			end
		end
	end
	return true
end