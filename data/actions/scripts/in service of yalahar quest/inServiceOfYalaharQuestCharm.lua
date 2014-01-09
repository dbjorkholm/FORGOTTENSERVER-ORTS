function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 9737 and itemEx.actionid == 100 and itemEx.itemid == 471) then
		if(getPlayerStorageValue(cid, 30) == 36) then
			doPlayerRemoveItem(cid,9737, 1)
          		doCreateItem(9738,1,toPosition) 
          		doSendMagicEffect(toPosition,47)
			local ret = doSummonCreature("Tormented Ghost", getThingPos(cid))
   	 		local ret2 = doSummonCreature("Tormented Ghost", getThingPos(cid))
         	 	doSendMagicEffect(getThingPos(ret), CONST_ME_TELEPORT)
          		doSendMagicEffect(getThingPos(ret2), CONST_ME_TELEPORT)
		end
	end
	return true
end