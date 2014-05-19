local function doTransformCampFire(cpPos, itemid, itemid2)
	local Tile = Position(cpPos):getTile()
	if Tile then
		local thing = Tile:getItemById(itemid)
		if thing and thing:isItem() then
			thing:transform(itemid2)
		end
	end
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local iteml = Item(item.uid)
	if item.itemid == 1945 then
		if item.uid == 50005 then
			doTransformCampFire({x = 32309, y = 31975, z = 13}, 1423, 1421)
		elseif item.uid == 50006 then
			doTransformCampFire({x = 32309, y = 31976, z = 13}, 1423, 1421)
		elseif item.uid == 50007 then
			doTransformCampFire({x = 32311, y = 31975, z = 13}, 1423, 1421)
		elseif item.uid == 50008 then
			doTransformCampFire({x = 32311, y = 31976, z = 13}, 1423, 1421)
		elseif item.uid == 50009 then
			doTransformCampFire({x = 32313, y = 31975, z = 13}, 1423, 1421)
		elseif item.uid == 50010 then
			doTransformCampFire({x = 32313, y = 31976, z = 13}, 1423, 1421)
		end		
		iteml:transform(1946)
	else
		if item.uid == 50005 then
			doTransformCampFire({x = 32309, y = 31975, z = 13}, 1421, 1423)
		elseif item.uid == 50006 then
			doTransformCampFire({x = 32309, y = 31976, z = 13}, 1421, 1423)
		elseif item.uid == 50007 then
			doTransformCampFire({x = 32311, y = 31975, z = 13}, 1421, 1423)
		elseif item.uid == 50008 then
			doTransformCampFire({x = 32311, y = 31976, z = 13}, 1421, 1423)
		elseif item.uid == 50009 then
			doTransformCampFire({x = 32313, y = 31975, z = 13}, 1421, 1423)
		elseif item.uid == 50010 then
			doTransformCampFire({x = 32313, y = 31976, z = 13}, 1421, 1423)
		end
		iteml:transform(1945)
	end
	return true
end
