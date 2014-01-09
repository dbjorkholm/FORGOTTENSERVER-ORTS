local walls = {
	[2246] = {
		[1] = {pos = {x = 32763, y = 32292, z = 14}, id = 1026},
		[2] = {pos = {x = 32762, y = 32292, z = 14}, id = 1026},
		[3] = {pos = {x = 32761, y = 32292, z = 14}, id = 1026},
	},
	[2247] = {
		[1] = {pos = {x = 32760, y = 32289, z = 14}, id = 1025},
		[2] = {pos = {x = 32760, y = 32290, z = 14}, id = 1025},
		[3] = {pos = {x = 32760, y = 32291, z = 14}, id = 1025},
		[4] = {pos = {x = 32760, y = 32292, z = 14}, id = 1030}
	},
	[2248] = {
		[1] = {pos = {x = 32764, y = 32292, z = 14}, id = 1029},
		[2] = {pos = {x = 32764, y = 32291, z = 14}, id = 1025},
		[3] = {pos = {x = 32764, y = 32290, z = 14}, id = 1025},
		[4] = {pos = {x = 32764, y = 32289, z = 14}, id = 1025}
	},
	[2249] = {
		[1] = {pos = {x = 32760, y = 32288, z = 14}, id = 1027},
		[2] = {pos = {x = 32761, y = 32288, z = 14}, id = 1026},
		[3] = {pos = {x = 32762, y = 32288, z = 14}, id = 1026},
		[4] = {pos = {x = 32763, y = 32288, z = 14}, id = 1026},
		[5] = {pos = {x = 32764, y = 32288, z = 14}, id = 1028}
	}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getGlobalStorageValue(400) < 0) then
		setGlobalStorageValue(400, 0)
	end
	if(isInArray({2246, 2247, 2248, 2249}, item.uid) and item.itemid == 1945) then
		doTransformItem(item.uid, 1946)
		addEvent(doTransformItem, 8 * 1000, item.uid, 1945)
		for i = 1, #walls[item.uid] do
			local check = getTileItemById(walls[item.uid][i].pos, walls[item.uid][i].id).uid
			if (check ~= 0) then
				doRemoveItem(getTileItemById(walls[item.uid][i].pos, walls[item.uid][i].id).uid, 1)
				addEvent(doCreateItem, 7 * 1000, walls[item.uid][i].id, 1 , walls[item.uid][i].pos)
			end
		end
		setGlobalStorageValue(400, getGlobalStorageValue(400) + 1)
		addEvent(setGlobalStorageValue, 7 * 1000, 400, getGlobalStorageValue(400) - 1)
	end
	return true
end