function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 11100) then
		if(itemEx.actionid == 8002) then
			if(getPlayerStorageValue(cid, 1017) < 1) then
				doSummonCreature("thieving squirrel", toPosition)
				doSendMagicEffect(toPosition, CONST_ME_TELEPORT)
				setPlayerStorageValue(cid, 1017, 1)
				doSummonCreature("thieving squirrel", pos)
				doCreatureSay(cid, "You've marked the tree, but its former inhabitant has stolen your bait! Get it before it runs away!", TALKTYPE_ORANGE_1)
				doRemoveItem(item.uid)
			end
		elseif(itemEx.actionid == 8003) then
			if(getPlayerStorageValue(cid, 1017) == 1) then
				for i = 1, 5 do
					pos = toPosition
					doSummonCreature("wolf", pos)
					doSendMagicEffect(pos, CONST_ME_TELEPORT)
				end
				doSummonCreature("war wolf", toPosition)
				doSendMagicEffect(toPosition, CONST_ME_TELEPORT)
				setPlayerStorageValue(cid, 1017, 2)
				doCreatureSay(cid, "You have marked the tree but it seems someone marked it already! He is not happy with your actions and he brought friends!", TALKTYPE_ORANGE_1)
			end
		elseif(itemEx.actionid == 8004) then
			if(getPlayerStorageValue(cid, 1017) == 2) then
				for i = 1, 3 do
					pos = toPosition
					doSummonCreature("enraged squirrel", pos)
					doSendMagicEffect(pos, CONST_ME_TELEPORT)
				end
				setPlayerStorageValue(cid, 1017, 3)
				setPlayerStorageValue(cid, 1016, 6)
				doCreatureSay(cid, "You have marked the tree, but you also angered the aquirrel family who lived on it!", TALKTYPE_ORANGE_1)
			end
		end
	end
	return true
end