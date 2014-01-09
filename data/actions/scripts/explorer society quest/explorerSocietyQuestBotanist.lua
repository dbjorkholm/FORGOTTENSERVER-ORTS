function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 4869) then
		if(itemEx.itemid == 4138 and getPlayerStorageValue(cid, 90) == 16) then
			setPlayerStorageValue(cid, 90, 17)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
			doTransformItem(item.uid, 4870)
			doRemoveItem(itemEx.uid, 1)
		elseif(itemEx.itemid == 4149 and getPlayerStorageValue(cid, 90) == 19) then
			setPlayerStorageValue(cid, 92, 20)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
			doTransformItem(item.uid, 4871)
			doRemoveItem(itemEx.uid, 1)
		elseif(itemEx.itemid == 4242 and getPlayerStorageValue(cid, 90) == 24) then
			setPlayerStorageValue(cid, 93, 25)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
			doTransformItem(item.uid, 4872)
			doRemoveItem(itemEx.uid, 1)
		elseif(itemEx.itemid == 5659 and itemEx.uid == 3151) then
			setPlayerStorageValue(cid, 93, 25)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_RED)
			doRemoveItem(item.uid, 1)
			doTransformItem(item.uid, 5937)
		end
	end
	return true
end