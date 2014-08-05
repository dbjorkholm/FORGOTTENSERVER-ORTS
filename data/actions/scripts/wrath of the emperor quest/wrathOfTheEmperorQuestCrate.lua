function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 12284) then
		if(getPlayerStorageValue(cid, 1068) < 1 and getPlayerStorageValue(cid, Storage.WrathoftheEmperor.Questline) == 2) then
			doSetCreatureOutfit(cid, {lookTypeEx = 12496}, -1)
			setPlayerStorageValue(cid, 1068, 1)
			doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
		end
	end
	return true
end