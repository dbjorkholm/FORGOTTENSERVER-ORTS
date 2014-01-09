function onUse(cid, item, fromPosition, itemEx, toPosition)
	doSendMagicEffect(toPosition, CONST_ME_DRAWBLOOD)
	doTransformItem(item.uid, math.random(7588, 7589))
	return true
end