function onAddItem(moveitem, tileitem, position)
	local setting = ItemTeleports[tileitem.actionid]
	if not setting then
		return true
	end

	Item(moveitem.uid):moveTo(setting.destination)
	setting.destination:sendMagicEffect(setting.effect)
	return true
end