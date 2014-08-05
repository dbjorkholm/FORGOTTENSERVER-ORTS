function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3182) then
		if(getPlayerStorageValue(cid, Storage.WrathoftheEmperor.Questline) >= 10) then
			if(item.itemid == 3542) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 3543)
			end
		end
	end
	return true
end