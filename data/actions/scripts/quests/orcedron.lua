function onUse(cid, item, fromPosition, itemEx, toPosition)
    	if (item.itemid == 1945) then
		doRemoveItem(getTileItemById({ x = 33171 , y = 31897 , z = 8}, 1285).uid)
        	doTransformItem(item.uid, 1946)
	else
		doCreateItem(1285, 1, { x = 33171 , y = 31897 , z = 8})
        	doTransformItem(item.uid, 1945)
	end
	return true
end