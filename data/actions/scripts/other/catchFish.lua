function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 5928 and itemEx.itemid == 5554) then
				if(math.random(100) == 1) then
					doTransformItem(item.uid, 8766)
					doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
					doCreatureSay(cid, "You catch a golden fish in the bowl.", TALKTYPE_MONSTER_SAY)
				else
					doCreatureSay(cid, "The golden fish escaped.", TALKTYPE_MONSTER_SAY)
				end
			end
	return true
end
