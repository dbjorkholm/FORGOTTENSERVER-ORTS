function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerStorageValue(cid, 121) == 39) then
		if(item.itemid == 7289) then
			if(itemEx.itemid == 1354) then
				if(isInArray({100, 101, 102, 103}, itemEx.actionid)) then
					if(getPlayerStorageValue(cid, itemEx.actionid + 40) < 1) then
						setPlayerStorageValue(cid, itemEx.actionid + 40, 1)
						doSendMagicEffect(toPosition, CONST_ME_FIREWORK_BLUE)
						doCreatureSay(cid, "You mark an obelisk with the frost charm.", TALKTYPE_ORANGE_1)
					end
				end
			end
		end
	end
	return true
end