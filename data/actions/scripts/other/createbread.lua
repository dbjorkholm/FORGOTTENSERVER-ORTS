local liquidContainers = {1775, 2005, 2006, 2007, 2008, 2009, 2011, 2012, 2013, 2014, 2015, 2023, 2031, 2032, 2033}
local millstones = {1381, 1382, 1383, 1384}
local cfg_types = {
	[1] = 2693,
	[6] = 6277
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	local targetItem = Item(itemEx.uid)
    	if item.itemid == 2692 and isInArray(liquidContainers, itemEx.itemid) and cfg_types[itemEx.type] then
        	Item(item.uid):transform(item.itemid, item.type - 1)
       	 	player:addItem(cfg_types[itemEx.type], 1)
        	targetItem:transform(itemEx.itemid, 0)
    	elseif item.itemid == 2694 and isInArray(millstones, itemEx.itemid) then
        	Item(item.uid):transform(item.itemid, item.type - 1)
        	player:addItem(2692, 1)
	else
		return false
    	end
    	return true
end
