local liquidContainers = {1775, 2005, 2006, 2007, 2008, 2009, 2011, 2012, 2013, 2014, 2015, 2023, 2031, 2032, 2033}
local millstones = {1381, 1382, 1383, 1384}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	local i = Item(item.uid)
	local p = Player(cid)
	local iex = Item(itemEx.uid)
    if item.itemid == 2692 and isInArray(liquidContainers, itemEx.itemid) and itemEx.type == 1 then
        i:transform(item.itemid, item.type - 1)
        p:addItem(2693, 1)
        iex:transform(itemEx.itemid, 0)
    elseif isInArray(millstones, itemEx.itemid) then
        i:transform(item.itemid, item.type - 1)
        p:addItem(2692, 1)
    else
        return false
    end
    return true
end
