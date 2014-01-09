function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 1945) then
		if(getTileItemById({x = 32878, y = 32270, z = 14}, 2025).uid == 0 or getTileItemById({x = 32881, y = 32267, z = 14}, 2168).uid == 0 or getTileItemById({x = 32881, y = 32273, z = 14}, 6300).uid == 0 or getTileItemById({x = 32884, y = 32270, z = 14}, 1487).uid == 0) then
			--return true
		end
		local stone = getTileItemById({x = 32881, y = 32270, z = 14}, 1355).uid
		if (stone ~= 0) then
			doRemoveItem(stone, 1)
		end
		local tp = getTileItemById({x = 32881, y = 32270, z = 14}, 1387).uid 
		if (tp == 0) then
			local item = doCreateItem(1387, 1, {x = 32881, y = 32270, z = 14})
			doSetItemActionId(item, 9031)
		end
		doTransformItem(item.uid, 1946)
		doTransformItem(getTileItemById({x = 32874, y = 32263, z = 14}, 3729).uid, 3733)
		doTransformItem(getTileItemById({x = 32875, y = 32263, z = 14}, 3730).uid, 3734)
		doTransformItem(getTileItemById({x = 32874, y = 32264, z = 14}, 3731).uid, 3735)
		doTransformItem(getTileItemById({x = 32875, y = 32264, z = 14}, 3732).uid, 3736)	
		doRemoveItem(getTileItemById({x = 32878, y = 32270, z = 14}, 2025).uid, 1)
		doRemoveItem(getTileItemById({x = 32881, y = 32267, z = 14}, 2168).uid, 1)
		doRemoveItem(getTileItemById({x = 32881, y = 32273, z = 14}, 6300).uid, 1)
		doRemoveItem(getTileItemById({x = 32884, y = 32270, z = 14}, 1487).uid, 1)
	else
		doTransformItem(item.uid, 1945)
	end
	return true
end