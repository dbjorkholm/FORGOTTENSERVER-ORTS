function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid >= 15469 and itemEx.itemid <= 15474 then
		doRemoveItem(item.uid)
		doSendMagicEffect(toPosition, CONST_ME_HITAREA)
		if math.random(1,5) == 4 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "A hidden stash appears the very moment you turn the key. Unfortunately, the key breaks as you attempt to remove it from the lock.")
			doPlayerAddItem(cid, math.random(15573, 15575))
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You turn the key in the small lock at the side of the shelf and... the key breaks. Other than that absolutely nothing happens.")			
		end
		return true
	end
return false
end
