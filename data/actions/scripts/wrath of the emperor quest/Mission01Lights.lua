function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3171) then
		if Game.getStorageValue(8018) ~= 1 then
			Game.setStorageValue(8018, 1)
			addEvent(Game.setStorageValue, 20 * 1000, 8018, 0)
			pos = {
				{x = 33369, y = 31075, z = 8},
				{x = 33372, y = 31075, z = 8}
			}
			for i = 1, 2 do
				doTransformItem(getTileItemById(pos[i], 11447).uid, 11446)
				addEvent(doTransformItem, 20 * 1000, getTileItemById(pos[i], 11446).uid, 11447)
			end
		end
	elseif(item.uid == 3172) then
		if Game.getStorageValue(8019) ~= 1 then
			Game.setStorageValue(8019, 1)
			addEvent(Game.setStorageValue, 20 * 1000, 8019, 0)
			pos = {x = 33360, y = 31079, z = 8}
			doTransformItem(getTileItemById(pos, 11449).uid, 11463)
			addEvent(doTransformItem, 20 * 1000, getTileItemById(pos, 11463).uid, 11449)
		end
	elseif(item.uid == 3173) then
		if Game.getStorageValue(8020) ~= 1 then
			Game.setStorageValue(8020, 1)
			addEvent(Game.setStorageValue, 20 * 1000, 8020, 0)
			pos = {x = 33346, y = 31074, z = 8}
			doTransformItem(getTileItemById(pos, 11449).uid, 11463)
			addEvent(doTransformItem, 20 * 1000, getTileItemById(pos, 11463).uid, 11449)
		end
	elseif(item.uid == 3174) then
		if Game.getStorageValue(8021) ~= 1 then
			Game.setStorageValue(8021, 1)
			addEvent(Game.setStorageValue, 20 * 1000, 8021, 0)
			for i = 1, 4 do
				doRemoveItem(getTileItemById({x = 33355, y = 31067 + i, z = 9}, 9264).uid)
				addEvent(doCreateItem, 20 * 1000, 9264, 1, {x = 33355, y = 31067 + i, z = 9})
			end
		end
	end
	return true
end