local tic = {
	[1] = {pos = {x = 32845, y = 32264, z = 14, stackpos = 1}, id = 2639},
	[2] = {pos = {x = 32843, y = 32266, z = 14, stackpos = 1}, id = 2639},
	[3] = {pos = {x = 32843, y = 32268, z = 14, stackpos = 1}, id = 2639},
	[4] = {pos = {x = 32845, y = 32268, z = 14, stackpos = 1}, id = 2639},
	[5] = {pos = {x = 32844, y = 32267, z = 14, stackpos = 1}, id = 2639},
	[6] = {pos = {x = 32840, y = 32269, z = 14, stackpos = 1}, id = 2639},
	[7] = {pos = {x = 32841, y = 32269, z = 14, stackpos = 1}, id = 2638},
	[8] = {pos = {x = 32840, y = 32268, z = 14, stackpos = 1}, id = 2638},
	[9] = {pos = {x = 32842, y = 32267, z = 14, stackpos = 1}, id = 2638}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 1945) then
		for i = 1, 9 do
			if(getThingfromPos(tic[i].pos).itemid ~= tic[i].id) then
				return true
			end
		end
		for i = 1, 9 do
			local tic = getThingfromPos(tic[i].pos).uid
			if (tic ~= 0) then
				doRemoveItem(getThingfromPos(tic[i].pos).uid, 1)
			end
		end
		doTransformItem(item.uid, 1946)
		local crack = getTileItemById({x = 32836, y = 32288, z = 14}, 6299).uid
		if (crack ~= 0) then
			doRemoveItem(crack, 1)
		end
		local tp = getTileItemById({x = 32836, y = 32288, z = 14}, 1387).uid 
		if (tp == 0) then
			local item = doCreateItem(1387, 1, {x = 32836, y = 32288, z = 14})
			doSetItemActionId(item, 9032)
		end
	else
		doTransformItem(item.uid, 1945)
	end
	return true
end