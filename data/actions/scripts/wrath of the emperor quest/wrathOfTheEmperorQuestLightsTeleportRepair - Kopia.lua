function onUse(cid, item, fromPosition, itemEx, toPosition)

	if(item.itemid == 2554 and itemEx.actionid == 8024) then
		doPlayerAddItem(cid, 12297, 1)
		doCreatureSay(cid, "You dig out a handful of earth from this sacred place.", TALKTYPE_MONSTER_SAY)
	elseif(item.itemid == 2549 and itemEx.actionid == 8024) then
		doPlayerAddItem(cid, 12285, 1)
		doCreatureSay(cid, "You dig out a handful of ordinary clay.", TALKTYPE_MONSTER_SAY)
	elseif((item.itemid == 12285 and itemEx.itemid == 12297) or (item.itemid == 12297 and itemEx.itemid == 12285)) then
		doCreatureSay(cid, "You carefully mix the clay with the sacred earth.", TALKTYPE_MONSTER_SAY)
		doRemoveItem(item.uid)
		doRemoveItem(itemEx.uid)
		doPlayerAddItem(cid, 12300, 1)
	elseif(item.itemid == 2553 and itemEx.itemid == 12296) then
		doPlayerAddItem(cid, 12295, 1)
		doCreatureSay(cid, "The cracked part of the table lets you cut out a large chunk of wood with your pick.", TALKTYPE_MONSTER_SAY)
	elseif(item.itemid == 5908 and itemEx.itemid == 12295) then
		doTransformItem(itemEx.uid, 12287)
		doCreatureSay(cid, "You carve a solid bowl of the chunk of wood.", TALKTYPE_MONSTER_SAY)
	elseif(item.itemid == 12300 and itemEx.itemid == 12287) then
		doCreatureSay(cid, "You carefully coat the inside of the wooden bowl with the sacred clay.", TALKTYPE_MONSTER_SAY)
		doRemoveItem(itemEx.uid)
		doTransformItem(item.uid, 12303)
	elseif(item.itemid == 12303 and itemEx.itemid == 11450) then 
		doCreatureSay(cid, "Filling the corrupted water into the sacred bowl completly purifies the fluid.", TALKTYPE_MONSTER_SAY)
		doTransformItem(item.uid, 12289)
	elseif(item.itemid == 12289 and itemEx.itemid == 12301) then
		doTransformItem(item.uid, 12290)
		doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_POFF)
	elseif(item.itemid == 12290 and itemEx.actionid == 8025) then
		doCreatureSay(cid, "As you give the coal into the pool the corrupted fluid begins to dissolve, leaving purified, refreshing water.", TALKTYPE_MONSTER_SAY)
		doRemoveItem(item.uid)
		setPlayerStorageValue(cid, 1060, 5)
		pos = {
			{x = 33282, y = 31036, z = 10},
			{x = 33282, y = 31037, z = 10},
			{x = 33283, y = 31037, z = 10},
			{x = 33283, y = 31036, z = 10},
			{x = 33283, y = 31038, z = 10},
			{x = 33283, y = 31035, z = 10},
		}
		for i = 1, 4 do
			doSendMagicEffect(pos[i], CONST_ME_GREEN_RINGS)
		end
		for i = 1, 6 do
			doTransformItem(getTileItemById(pos[i], 11450).uid, 11030)
			addEvent(doTransformItem, 60 * 1000, getTileItemById(pos[i], 11030).uid, 11450)
		end
	end
	return true
end