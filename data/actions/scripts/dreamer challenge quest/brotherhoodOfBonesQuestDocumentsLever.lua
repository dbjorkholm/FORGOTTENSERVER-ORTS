function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3045) then
		if(item.itemid == 1945) then
			if(getTileItemById({x = 32784, y = 32222, z = 14}, 2145).uid) then
				doTransformItem(item.uid, 1946)
				doSendMagicEffect({x = 32784, y = 32222, z = 14}, CONST_ME_TELEPORT)
				doCreateItem(7844, 1, {x = 32784, y = 32222, z = 14})
				doRemoveItem(getTileItemById({x = 32784, y = 32222, z = 14}, 2145).uid, 1)
				addEvent(doTransformItem, 4 * 1000, item.uid, 1945)
			end
		end
	elseif(item.uid == 3046) then
		if(item.itemid == 1945) then
			if(getTileItemById({x = 32785, y = 32230, z = 14}, 2145).uid) then
				doTransformItem(item.uid, 1946)
				doSendMagicEffect({x = 32785, y = 32230, z = 14}, CONST_ME_TELEPORT)
				doCreateItem(7846, 1, {x = 32785, y = 32230, z = 14})
				doRemoveItem(getTileItemById({x = 32785, y = 32230, z = 14}, 2145).uid, 1)
				addEvent(doTransformItem, 4 * 1000, item.uid, 1945)
			end
		end
	elseif(item.uid == 3047) then
		if(item.itemid == 1945) then
			if(getTileItemById({x = 32781, y = 32226, z = 14}, 2145).uid) then
				doTransformItem(item.uid, 1946)
				doSendMagicEffect({x = 32781, y = 32226, z = 14}, CONST_ME_TELEPORT)
				doCreateItem(7845, 1, {x = 32781, y = 32226, z = 14})
				doRemoveItem(getTileItemById({x = 32781, y = 32226, z = 14}, 2145).uid, 1)
				addEvent(doTransformItem, 4 * 1000, item.uid, 1945)
			end
		end
	end
	return true
end