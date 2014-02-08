local holes = {468, 481, 483}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(isInArray(holes, itemEx.itemid)) then
		Item(itemEx.uid):transform(itemEx.itemid + 1)
		Item(itemEx.uid):decay()
	elseif(itemEx.itemid == 7932) then
		Item(itemEx.uid):transform(7933)
		Item(itemEx.uid):decay()
	elseif(itemEx.itemid == 231 or itemEx.itemid == 9059) then
		local rand = math.random(1, 100)
		if(itemEx.actionid  == 100 and rand <= 20) then
			Item(itemEx.uid):transform(489)
			Item(itemEx.uid):decay()
		elseif(rand == 1) then
			doCreateItem(2159, 1, toPosition)
		elseif(rand > 95) then
			doSummonCreature("Scarab", toPosition)
		end
		Position(toPosition):sendMagicEffect(CONST_ME_POFF)
	elseif(itemEx.aid == 4654 and Player(cid):getStorageValue(9925) == 1 and Player(cid):getStorageValue(9926 < 1)) then
		Player(cid):sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You found a piece of the scroll. You pocket it quickly.')
		Position(Creature(cid):getPosition()):sendMagicEffect(CONST_ME_POFF)
		Player(cid):addItem(21250, 1)
		Player(cid):setStorageValue(9926, 1)
	elseif(itemEx.aid == 4668 and Player(cid):getStorageValue(9943) == 1 and Player(cid):getStorageValue(9944) < 1) then
		Player(cid):sendTextMessage(MESSAGE_EVENT_ADVANCE, 'A torn scroll piece emerges. Probably gnawed off by rats.')
		Position(Creature(cid):getPosition()):sendMagicEffect(CONST_ME_POFF)
		Player(cid):addItem(21250, 1)
		Player(cid):setStorageValue(9944, 1)
	elseif(isInArray(holes, itemEx.itemid)) then
		Item(itemEx.uid):transform(itemEx.itemid + 1)
        	Item(itemEx.uid):decay()
	else
		return false
	end
return true
end
