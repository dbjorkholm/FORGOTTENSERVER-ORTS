function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3070) then
		if(getTileItemById({x = 33281, y = 32442, z = 8}, 3698).uid > 0 and getTileItemById({x = 33286, y = 32444, z = 8}, 3698).uid > 0) then
			if(getTileItemById({x = 33273, y = 32458, z = 8}, 7520).uid > 0) then
				doTransformItem(getTileItemById({x = 33273, y = 32458, z = 8}, 7520).uid, 7525)
			else
				doTransformItem(getTileItemById({x = 33273, y = 32458, z = 8}, 7525).uid, 7520)
			end
			doCreatureSay(cid, "Click!", TALKTYPE_ORANGE_1, false, cid, {x = 33273, y = 32452, z = 8})
		end
	end
	return true
end