local demonPos = {
	{x=33060, y=31623, z=15},
	{x=33066, y=31623, z=15},
	{x=33060, y=31627, z=15},
	{x=33066, y=31627, z=15}
}

local targetItem = Item(itemEx.actionid)

function onRemoveItem(item, tile, position)
	if(itemEx.itemid == 1953 and targetItem == 60999) and if getDistanceBetween(targetItem:getPosition(), position) > 0 then
		targetItem:setActionId(0)
		doSummonCreature("Demon", demonPos)
	end
	return true
end
