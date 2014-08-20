function transfer_statue_back(pos)
doTransformItem(getTileItemById(pos, 15267).uid, 15251)
doSendMagicEffect(pos, CONST_ME_POFF)
return true
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid, 986) == 2 then
		return false
	else
		if itemEx.itemid == 15251 then
			doRemoveItem(item.uid)
			setPlayerStorageValue(cid, 988, getPlayerStorageValue(cid, 988) + math.random(1, 5))
			if math.random(1, 100) < getPlayerStorageValue(cid, 988) then
				doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_EXPLOSIONHIT)
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You successfully managed to insert gem in the statue. Talk with George about your success.")
				addEvent(transfer_statue_back, 60000, getThingPos(itemEx.uid))
				doTransformItem(itemEx.uid, 15267)
				setPlayerStorageValue(cid, 986, 2)
				setPlayerStorageValue(cid, 981, 1)
			else
				doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_HITAREA)
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "The gem shatters the moment you place it. You realise the difficult task at hand and you will surely be more careful next time.")
			end
			return true
		end
	end
return false
end
