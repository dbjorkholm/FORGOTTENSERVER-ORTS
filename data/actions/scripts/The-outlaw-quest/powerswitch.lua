-- Script by Nottinghster
function onUse(cid, item, frompos, item2, topos)

local event = 0

local powerpos = {x=32594, y=32214, z=9, stackpos=255}
local power2pos = {x=32613, y=32220, z=10, stackpos=255}
local wallpos = {x=32604, y=32216, z=9, stackpos=1}

local getpower = getThingfromPos(powerpos)
local getpower2 = getThingfromPos(power2pos)
local getwall = getThingfromPos(wallpos)


    if item.uid == 3401 and 
	item.itemid == 1945 and 
	getpower.itemid == 2166 and
	getwall.itemid == 1026 then
    doRemoveItem(getpower.uid,1)
    doRemoveItem(getwall.uid,1)
	doCreateItem(2166,1,power2pos)
    doTransformItem(item.uid,item.itemid+1)
	event = addEvent(doCreateItem, 600000, 1026, 1, wallpos)
	doSendMagicEffect(power, 8)
    elseif item.uid == 3401 and 
	item.itemid == 1946 and 
	getpower.itemid == 2166 and
	getwall.itemid == 1026 then
    doRemoveItem(getpower.uid,1)
    doRemoveItem(getwall.uid,1)
	doCreateItem(2166,1,power2pos)
    doTransformItem(item.uid,item.itemid-1)
	event = addEvent(doCreateItem, 600000, 1026, 1, wallpos)
	doSendMagicEffect(power, 8)
    else
        doPlayerSendCancel(cid,"Sorry, not possible.")
    end
    
return TRUE
end
