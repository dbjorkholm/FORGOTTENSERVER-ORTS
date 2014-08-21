function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 1945) then
		if(getTileItemById({x = 32826, y = 32274, z = 11}, 1285).uid > 0) then
			doRemoveItem(getTileItemById({x = 32826, y = 32274, z = 11}, 1285).uid, 1)
		end
		doTransformItem(item.uid, 1946)
	else
		doTransformItem(item.uid, 1945)
	end
	return true
end