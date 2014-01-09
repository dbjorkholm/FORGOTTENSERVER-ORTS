function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3165) then
		if(getPlayerStorageValue(cid, 1050) >= 9) then
			if(item.itemid == 10791) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 10792)
			end
		end
	end
	return true
end