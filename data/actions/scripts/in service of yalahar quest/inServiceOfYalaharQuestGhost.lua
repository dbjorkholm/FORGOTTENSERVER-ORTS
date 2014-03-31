function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid == 9738 then  
		local ret = doSummonCreature("Tormented Ghost", getThingPos(cid))
    		local ret2 = doSummonCreature("Tormented Ghost", getThingPos(cid))    
          	doSendMagicEffect(getThingPos(ret), CONST_ME_TELEPORT)
          	doSendMagicEffect(getThingPos(ret2), CONST_ME_TELEPORT)
          	doSendMagicEffect(toPosition,65)
          	doRemoveItem(item.uid, 1)
		doCreatureSay(cid, "The ghost charm is charging.", TALKTYPE_ORANGE_1)
          	doTransformItem(getTileItemById( {x=32776,y=31062,z =7},9738 ).uid, 9739) 
    	elseif itemEx.itemid == 9739 then 
		local ret = doSummonCreature("Tormented Ghost", getThingPos(cid))
    		local ret2 = doSummonCreature("Tormented Ghost", getThingPos(cid))  
          	doSendMagicEffect(getThingPos(ret), CONST_ME_TELEPORT)
          	doSendMagicEffect(getThingPos(ret2), CONST_ME_TELEPORT)
          	doSendMagicEffect(toPosition,65)
          	doRemoveItem(item.uid, 1)
		doCreatureSay(cid, "The ghost charm is charging.", TALKTYPE_ORANGE_1)
          	doTransformItem(getTileItemById( {x=32776,y=31062,z =7},9739 ).uid, 9740)
    	elseif itemEx.itemid == 9740 then 
		local ret = doSummonCreature("Tormented Ghost", getThingPos(cid))
    		local ret2 = doSummonCreature("Tormented Ghost", getThingPos(cid))  
          	doSendMagicEffect(getThingPos(ret), CONST_ME_TELEPORT)
          	doSendMagicEffect(getThingPos(ret2), CONST_ME_TELEPORT)
          	doSendMagicEffect(toPosition,65)
          	doRemoveItem(item.uid, 1)
		doCreatureSay(cid, "The ghost charm is charging.", TALKTYPE_ORANGE_1)
          	doTransformItem(getTileItemById( {x=32776,y=31062,z =7},9740).uid, 9773)
    	elseif itemEx.itemid == 9773 then
		local ret = doSummonCreature("Tormented Ghost", getThingPos(cid))
    		local ret2 = doSummonCreature("Tormented Ghost", getThingPos(cid))  
          	doSendMagicEffect(getThingPos(ret), CONST_ME_TELEPORT)
          	doSendMagicEffect(getThingPos(ret2), CONST_ME_TELEPORT)
          	doSendMagicEffect(toPosition,65)
          	doRemoveItem(item.uid, 1)
	  	setPlayerStorageValue(cid, 30, 37)
		Player(cid):setStorageValue(12017, 3) -- StorageValue for Questlog "Mission 06: Frightening Fuel"
	  	doPlayerRemoveItem(cid, 9737, 1)
	  	setPlayerStorageValue(cid, 15, 3)
	  	doCreatureSay(cid, "The ghost charm is charged.", TALKTYPE_ORANGE_1)
          	doTransformItem(getTileItemById( {x=32776,y=31062,z =7},9773).uid, 9742) 
          end  
          return true
end  