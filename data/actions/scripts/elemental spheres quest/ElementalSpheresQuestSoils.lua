local t = {
	[8304] = {useOn = 8572, transform = 8576, effect = CONST_ME_BIGPLANTS},
	[8305] = {useOn = 8573, transform = 8575},
	[8306] = {useOn = 8571, transform = 8574, effect = CONST_ME_ICEATTACK},
	[8307] = {useOn = 8567, create = 1495}
}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	local v = t[item.itemid]
	if v and v.useOn == itemEx.itemid then
		if v.transform then
			doTransformItem(itemEx.uid, v.transform)
		elseif v.create then
			doCreateItem(v.create, 1, toPosition)
		end
		if v.effect then
			doSendMagicEffect(toPosition, v.effect)
		end
		doDecayItem(itemEx.uid)
		doChangeTypeItem(item.uid, item.type - 1)
		return TRUE
	end
end