local spores = {
	[18328] = 18221,
	[18329] = 18222,
	[18330] = 18223,
	[18331] = 18224,
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(spores[item.itemid]) then
		spore = math.random(18221, 18224)
		doCreateItem(spore, 1, {x = toPosition.x, y = toPosition.y, z = toPosition.z, stackpos = toPosition.stackpos + 1})
		addEvent(doRemoveItem, 40 * 1000, getTileItemById(toPosition, spore).uid, 1)
		doSendMagicEffect(toPosition, CONST_ME_POFF)
	elseif(spores[item.itemid] and itemEx.itemid == spores[item.itemid]) then
		if(getPlayerStorageValue(cid, 949) < 4 and getPlayerStorageValue(cid, 948) == 1) then
			setPlayerStorageValue(cid, 949, getPlayerStorageValue(cid, 949) + 1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have gathered the correct spores.")
			doTransformItem(item.uid, item.itemid + 1)
			doSendMagicEffect(toPosition, CONST_ME_POFF)
		end
	elseif(spores[item.itemid] and itemEx.itemid ~= spores[item.itemid]) then
		if(getPlayerStorageValue(cid, 949) < 4 and getPlayerStorageValue(cid, 948) == 1) then
			setPlayerStorageValue(cid, 949, 0)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have gathered the wrong spores.You ruined your collection.")
			doTransformItem(item.uid, 18328)
			doSendMagicEffect(toPosition, CONST_ME_POFF)
		end
	end
	return true
end