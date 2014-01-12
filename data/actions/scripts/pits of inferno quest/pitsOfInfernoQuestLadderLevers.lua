local pos = {
	[1] = {x = 32861, y = 32305, z = 11, stackpos = 0},
	[2] = {x = 32860, y = 32313, z = 11},
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 1945) or (item.itemid == 1946) then
		if(item.uid == 3301) then
			doTransformItem(getThingfromPos(pos[1]).uid, 1284)
			for i = 1, 2 do
				newPos = {x = pos[1].x, y = pos[1].y, z = pos[1].z, stackpos = 1}
				doRemoveItem(getThingfromPos(newPos).uid)
			end
		elseif(item.uid == 3302) then
			doRemoveItem(getTileItemById(pos[2], 387).uid)
		end
		doTransformItem(item.uid, 1946)
	end
	return true
end