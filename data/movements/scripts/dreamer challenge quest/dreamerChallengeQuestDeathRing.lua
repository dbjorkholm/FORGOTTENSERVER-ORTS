local pos = {
	{x = 32857, y = 32231, z = 11},
	{x = 32857, y = 32232, z = 11},
	{x = 32857, y = 32233, z = 11}
}

function onAddItem(moveitem, tileitem, position)
	if(tileitem.uid == 2244 and moveitem.itemid == 6300) then
		doRemoveItem(moveitem.uid, 1)
		for i = 1, 3 do
			if(getTileItemById(pos[i], 2722).uid) then
				doRemoveItem(getTileItemById(pos[i], 2722).uid, 1)
				doSendMagicEffect(pos[i], CONST_ME_MAGIC_BLUE)
			end
		end
	end
	return true
end
			