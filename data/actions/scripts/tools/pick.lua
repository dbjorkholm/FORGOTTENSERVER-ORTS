function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (itemEx.uid <= 65535 or itemEx.actionid > 0) then
		if (itemEx.itemid == 354 or itemEx.itemid == 355) then
			local iEx = Item(itemEx.uid)
			iEx:transform(392)
			iEx:decay()
			toPosition:sendMagicEffect(CONST_ME_POFF)
		elseif itemEx.itemid == 7200 then
			iEx:transform(7236)
        		iEx:decay()
       		 	toPosition:sendMagicEffect(CONST_ME_HITAREA)
		end
	end
	return true
end
