function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 9013) then
		if(getPlayerStorageValue(cid, 30) >= 30 and getPlayerStorageValue(cid, 9013) < 1) then
			local ret = doSummonCreature("Morik the Gladiator", getThingPos(cid)) 
	    		doSendMagicEffect(getThingPos(ret), CONST_ME_TELEPORT)
            		setPlayerStorageValue(cid,9013, 1)
	        end
	end
	return true
end