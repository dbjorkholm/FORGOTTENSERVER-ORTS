-- Script by Nottinghster
function onUse(cid, item, frompos, item2, topos)



local powerpos = {x=32613, y=32220, z=10, stackpos=255}
local barrelpos = {x=32614, y=32209, z=10, stackpos=1}
local wallpos = {x=32614, y=32205, z=10, stackpos=1}
local stonepos = {x=32614, y=32206, z=10, stackpos=1}
local burn1pos = {x=32613, y=32220, z=10, stackpos=1}
local burn2pos = {x=32615, y=32221, z=10, stackpos=1}


local getpower = getThingfromPos(powerpos)
local getbarrel = getThingfromPos(barrelpos)
local getwall = getThingfromPos(wallpos)
local getstone = getThingfromPos(stonepos)


    if item.uid == 3402 and 
	item.itemid == 1945 and 
	getpower.itemid == 2166 and
	getwall.itemid == 1025 and
	getstone.itemid == 1304 and
	getbarrel.itemid == 1774 then
        doRemoveItem(getpower.uid,1)
        doRemoveItem(getwall.uid,1)
        doRemoveItem(getstone.uid,1)
		doCreateItem(1025,1,stonepos)
        doTransformItem(item.uid,item.itemid+1)
		doSendMagicEffect(burn1pos, 15)
		doSendMagicEffect(burn2pos, 15)

		
    elseif item.uid == 3402 and 
	item.itemid == 1946 then 
        doTransformItem(item.uid,item.itemid-1)
    else
        doPlayerSendCancel(cid,"Sorry, not possible.")
    end
    
return TRUE
end
