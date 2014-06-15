function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3075) then
		local player = Player(cid)
		if(player:getStorageValue(Storage.InServiceofYalahar.Questline) >= 16) then
			if(item.itemid == 1255) then
				player:teleportTo(toPosition, true)
				doTransformItem(item.uid, 1256)
			end
		end
	end
	return true
end