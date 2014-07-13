function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 1021) then
		if(item.itemid == 1945) then
			if(getThingfromPos({x = 32800, y = 32339, z = 11, stackpos = STACKPOS_FIRST_ITEM_ABOVE_GROUNDTILE}).type == 11) then
				doTransformItem(getThingfromPos({x = 32801, y = 32336, z = 11, stackpos = STACKPOS_GROUND}).uid, 5770)
				addEvent(doTransformItem, 10 * 60 * 1000, getThingfromPos({x = 32801, y = 32336, z = 11, stackpos = STACKPOS_GROUND}).uid, 493)
				doTransformItem(item.uid, 1946)
				addEvent(doTransformItem, 10 * 60 * 1000, item.uid, 1946)
			else
				doCreatureSay(cid, "The lever is creaking and rusty.", TALKTYPE_MONSTER_SAY)
			end
		end
	end
	return true
end