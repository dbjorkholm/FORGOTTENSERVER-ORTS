local upFloorIds = {1386, 3678, 5543}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if isInArray(upFloorIds, item.itemid) == TRUE then
		fromPosition.y = fromPosition.y + 1
		fromPosition.z = fromPosition.z - 1
		doTeleportThing(cid, fromPosition, FALSE)
	else
		if(itemEx.actionid  == 1000 and itemEx.itemid == 1369) then
			fromPosition.z = fromPosition.z + 1
			doTeleportThing(cid, fromPosition, FALSE)
		end
	end
	return TRUE
end