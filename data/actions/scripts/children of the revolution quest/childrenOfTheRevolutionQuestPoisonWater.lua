function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 10760 and itemEx.actionid == 8012) then
		if(getPlayerStorageValue(cid, 1050) == 10) then
			setPlayerStorageValue(cid, 1050, 11)
			doRemoveItem(item.uid, 1)
			doCreatureSay(cid, "The rice has been poisoned. This will weaken the Emperor's army significantly. Return and tell Zalamon about your success.", TALKTYPE_ORANGE_1)
		end
	end
	return true
end