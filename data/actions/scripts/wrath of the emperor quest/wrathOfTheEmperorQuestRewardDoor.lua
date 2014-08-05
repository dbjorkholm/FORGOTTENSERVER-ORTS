function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3199) then
		if(getPlayerStorageValue(cid, Storage.WrathoftheEmperor.Questline) >= 36) then
			if(item.itemid == 12195) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 12196)
			end
		end
	end
	return true
end