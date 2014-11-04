function onStepOut(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if player and player:isInGhostMode() then
		return true
	end

	local snowItem = Item(item.uid)
	if item.itemid == 670 then
		snowItem:transform(6594)
	else
		snowItem:transform(item.itemid + 15)
	end
	snowItem:decay()
	return true
end
