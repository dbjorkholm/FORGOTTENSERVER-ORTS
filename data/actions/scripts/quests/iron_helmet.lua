function onUse(cid, item, fromPosition, itemEx, toPosition)
    	if (item.itemid == 1945) then
		doRemoveItem(getTileItemById({ x = 32780 , y = 32231 , z = 8}, 387).uid)
        	doTransformItem(item.uid, 1946)
	else
		doCreateItem(387, 1, { x = 32780 , y = 32231 , z = 8})
        	doTransformItem(item.uid, 1945)
	end
	return true
end