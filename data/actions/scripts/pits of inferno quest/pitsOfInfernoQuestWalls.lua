local pos = {
	[2025] = {x = 32831, y = 32333, z = 11},
	[2026] = {x = 32833, y = 32333, z = 11},
	[2027] = {x = 32835, y = 32333, z = 11},
	[2028] = {x = 32837, y = 32333, z = 11}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 1945) then
		doRemoveItem(getTileItemById(pos[item.uid], 6289).uid, 1)
		doRemoveItem(getTileItemById(pos[item.uid], 6289).uid, 1)
		doSendMagicEffect(pos[item.uid], CONST_ME_FIREATTACK)
	else
		doCreateItem(6289, 1, pos[item.uid])
		doSendMagicEffect(pos[item.uid], CONST_ME_FIREATTACK)
	end
	
	if (item.itemid == 1945) then
		doTransformItem(item.uid, item.itemid + 1)
	else
		doTransformItem(item.uid, item.itemid - 1)
	end
	
	return true
end
