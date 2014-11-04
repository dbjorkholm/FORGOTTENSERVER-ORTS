local config = {
	[8298] = {targetId = 8572, transformId = 8576, effect = CONST_ME_BIGPLANTS},
	[8299] = {targetId = 8573, transformId = 8575},
	[8302] = {targetId = 8571, transformId = 8574, effect = CONST_ME_ICEATTACK},
	[8303] = {targetId = 8567, createId = 1495}
}

function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	local soil = config[item.itemid]
	if not soil then
		return true
	end

	if soil.targetId ~= itemEx.itemid then
		return true
	end

	if soil.transformId then
		local targetItem = Item(itemEx.uid)
		targetItem:transform(soil.transformId)
		targetItem:decay()
	elseif soil.createId then
		local newItem = Game.createItem(soild.createId, 1, toPosition)
		if newItem then
			newItem:decay()
		end
	end

	if soil.effect then
		toPosition:sendMagicEffect(soil.effect)
	end

	Item(item.uid):transform(item.itemid, item.type - 1)
	return true
end