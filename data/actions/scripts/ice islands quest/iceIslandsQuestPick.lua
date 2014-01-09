local chakoyas = {
	"chakoya toolshaper",
	"chakoya tribewarden",
	"chakoya windcaller"
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(itemEx.actionid == 100 and itemEx.itemid == 7185 and item.itemid == 2553) then
		if(getPlayerStorageValue(cid, 121) == 4) then
			setPlayerStorageValue(cid, 122, getPlayerStorageValue(cid, 122) < 1 and 1 or getPlayerStorageValue(cid, 122) + 1)
			doSummonCreature(chakoyas[math.random(1, 3)], toPosition)
			doSendMagicEffect(toPosition, CONST_ME_TELEPORT)
			addEvent(doTransformItem, 5 * 60 * 1000, itemEx.uid, 7185)
			doTransformItem(itemEx.uid, 7186)
			if(getPlayerStorageValue(cid, 122) >= 3) then
				setPlayerStorageValue(cid, 121, 5)
			end
		end
	end
	return true
end