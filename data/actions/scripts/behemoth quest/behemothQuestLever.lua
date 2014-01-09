local wall = {
	{x = 33295, y = 31677, z = 15},
	{x = 33296, y = 31677, z = 15},
	{x = 33297, y = 31677, z = 15},
	{x = 33298, y = 31677, z = 15},
	{x = 33299, y = 31677, z = 15}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 1945) then
		for i = 1, #wall do
			doRemoveItem(getTileItemById(wall[i], 1304).uid, 1)
		end
		doTransformItem(item.uid, 1946)
	end
	return true
end