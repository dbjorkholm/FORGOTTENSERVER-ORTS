function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3161) then
		if(item.itemid == 10782) then
			doTeleportThing(cid, toPosition, true)
			doTransformItem(item.uid, item.itemid + 1)
		end
	end
	return true
end