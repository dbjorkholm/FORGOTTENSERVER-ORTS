local altars = {
	{x = 32777, y = 31982, z = 9},
	{x = 32779, y = 31977, z = 9},
	{x = 32781, y = 31982, z = 9}
}
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.actionid == 2002) then
		if(getPlayerStorageValue(cid, 200) == 8) then
			setPlayerStorageValue(cid, 200, 9)
			local k = {}
			for _, v in ipairs(altars) do
				local tmp = getTileItemById(v, 2199).uid
				if (tmp == 0) then
					doSummonCreature("The Count", toPosition)
					return true
				else
					table.insert(k, tmp)
				end
			end
			for i = 1, #k do
				doRemoveItem(k[i])
			end
			doSummonCreature("The Weakened Count", toPosition)
			return true
		end
	end
end