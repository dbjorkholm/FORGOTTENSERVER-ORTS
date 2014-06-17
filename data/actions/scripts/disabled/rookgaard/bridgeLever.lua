function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.actionid == 5090) then
		if(item.itemid == 1945) then
			doTransformItem(getTileItemById({}, 5770).uid, 4616)
			doTransformItem(item.uid, 1945)
		elseif(item.itemid == 1946) then
			doTransformItem(getTileItemById({}, 4616).uid, 5770)
			doTransformItem(item.uid, 1945)
		end
	end
	return true
end