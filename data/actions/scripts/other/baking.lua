local liquidContainers = {1775, 2005, 2006, 2007, 2008, 2009, 2011, 2012, 2013, 2014, 2015, 2023, 2031, 2032, 2033}
local millstones = {1381, 1382, 1383, 1384}
local dough = {6277, 8846}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	local useItem = Item(item.uid)
	local targetItem = Item(itemEx.uid)

	if item.itemid == 2692 and isInArray(liquidContainers, itemEx.itemid) then
		if itemEx.type == 1 then
			useItem:transform(item.itemid, item.type - 1)
			player:addItem(2693, 1)
			targetItem:transform(itemEx.itemid, 0)
		elseif itemEx.type == 6 then
			useItem:transform(item.itemid, item.type - 1)
			player:addItem(6277, 1)
			targetItem:transform(itemEx.itemid, 0)
		end
	elseif isInArray(dough, item.itemid) then
		if itemEx.itemid == 1786 then
			useItem:transform(item.itemid, item.itemid + 1)
		elseif itemEx.itemid == 6574 then
			useItem:transform(8846)
			targetItem:transform(itemEx.itemid, 0)
		end
	elseif item.itemid == 2693 and itemEx.itemid == 1786 then
		useItem:transform(2689)
	elseif isInArray(millstones, itemEx.itemid) then
		useItem:transform(item.itemid, item.type - 1)
		player:addItem(2692, 1)
	else
		return false
	end

	return true
end
