function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3041) then
		if(item.itemid == 1945) then
			if(getTileItemById({x = 32836, y = 32221, z = 14}, 2145).uid) then
				doTransformItem(item.uid, 1946)
				doSendMagicEffect({x = 32836, y = 32221, z = 14}, CONST_ME_TELEPORT)
				doCreateItem(7844, 1, {x = 32836, y = 32221, z = 14})
				doRemoveItem(getTileItemById({x = 32836, y = 32221, z = 14}, 2145).uid, 1)
				addEvent(doTransformItem, 4 * 1000, item.uid, 1945)
			end
		end
	elseif(item.uid == 3042) then
		if(item.itemid == 1945) then
			if(getTileItemById({x = 32837, y = 32229, z = 14}, 2145).uid) then
				doTransformItem(item.uid, 1946)
				doSendMagicEffect({x = 32837, y = 32229, z = 14}, CONST_ME_TELEPORT)
				doCreateItem(7846, 1, {x = 32837, y = 32229, z = 14})
				doRemoveItem(getTileItemById({x = 32837, y = 32229, z = 14}, 2145).uid, 1)
				addEvent(doTransformItem, 4 * 1000, item.uid, 1945)
			end
		end
	elseif(item.uid == 3043) then
		if(item.itemid == 1945) then
			if(getTileItemById({x = 32833, y = 32225, z = 14}, 2145).uid) then
				doTransformItem(item.uid, 1946)
				doSendMagicEffect({x = 32833, y = 32225, z = 14}, CONST_ME_TELEPORT)
				doCreateItem(7845, 1, {x = 32833, y = 32225, z = 14})
				doRemoveItem(getTileItemById({x = 32833, y = 32225, z = 14}, 2145).uid, 1)
				addEvent(doTransformItem, 4 * 1000, item.uid, 1945)
			end
		end
	end
	return true
end