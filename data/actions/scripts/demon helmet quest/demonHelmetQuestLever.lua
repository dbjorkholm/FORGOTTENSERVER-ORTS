local t = {
	{x = 33314, y = 31592, z = 15}, -- stone position
	{x = 33316, y = 31591, z = 15}, -- teleport creation position
	{x = 33322, y = 31592, z = 14} -- where the teleport takes you
}
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 1945) then
		if(getPlayerLevel(cid) > 99) then
			local stone = getTileItemById(t[1], 1355).uid
			if(stone > 0) then
				doRemoveItem(stone)
			end
 
			doCreateTeleport(1387, t[3], t[2])
			doSendMagicEffect(t[2], CONST_ME_TELEPORT)
		else
			return (doPlayerSendCancel(cid, "You cannot use this object."))
		end
	elseif(item.itemid == 1946) then
		doRemoveItem(getTileItemById(t[2], 1387).uid)
		doSendMagicEffect(t[2], CONST_ME_POFF)
		doCreateItem(1355, 1, t[1])
	end
	return doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)
end