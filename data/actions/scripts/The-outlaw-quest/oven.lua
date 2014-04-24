-- Script by Viperthepala
function onUse(cid, item, frompos, item2, topos)

local oven1pos = {x=32623, y=32188, z=9, stackpos=1}
local oven2pos = {x=32623, y=32189, z=9, stackpos=1}

local getoven1 = getThingfromPos(oven1pos)
local getoven2 = getThingfromPos(oven2pos)


    if item.uid == 3400 and 
	item.itemid == 1945 and 
	getoven1.itemid == 1787 then
        doRemoveItem(getoven1.uid,1)
		 doCreateItem(1787,1,oven2pos)
        doTransformItem(item.uid,item.itemid+1)
    elseif item.uid == 3400 and
        item.itemid == 1945 and
        getoven1.itemid == 1786 then
        doRemoveItem(getoven1.uid,1)
                 doCreateItem(1786,1,oven2pos)
        doTransformItem(item.uid,item.itemid+1)
    elseif item.uid == 3400 and 
	item.itemid == 1946 and 
	getoven2.itemid == 1787 then
		doRemoveItem(getoven2.uid,1)
        doCreateItem(1787,1,oven1pos)
        doTransformItem(item.uid,item.itemid-1)
    elseif item.uid == 3400 and
        item.itemid == 1946 and
        getoven2.itemid == 1786 then
                doRemoveItem(getoven2.uid,1)
        doCreateItem(1786,1,oven1pos)
        doTransformItem(item.uid,item.itemid-1)
    else
        doPlayerSendCancel(cid,"Sorry, not possible.")
    end
    
return TRUE
end
