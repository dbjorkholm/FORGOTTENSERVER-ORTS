function onStepIn(cid, item, position, fromPosition)
	doTransformItem(item.uid, 425)
    	--[[if(item.actionid == 2245) then
        	doTeleportThing(getThingFromPos({x = position.x + 2, y = position.y, z = position.z, stackpos = 1}).uid, {x = 32842, y = 32340, z = 9})
        	for i = 1, 5 do
            		doTeleportThing(getThingFromPos({x = position.x + 2 + i, y = position.y, z = position.z, stackpos = 1}).uid, {x = position.x + 1 + i, y = position.y, z = position.z})
        	end
        	doTeleportThing(getThingFromPos({x = 32842, y = 32340, z = 9, stackpos = 1}).uid, {x = position.x + 7, y = position.y, z = position.z})
   	elseif(item.actionid == 2246) then
        	doTeleportThing(getThingFromPos({x = position.x, y = position.y + 2, z = position.z, stackpos = 1}).uid, {x = 32842, y = 32340, z = 9})
       	 	for i = 1, 5 do
            		doTeleportThing(getThingFromPos({x = position.x, y = position.y + 2 + i, z = position.z, stackpos = 1}).uid, {x = position.x, y = position.y + 1 + i, z = position.z})
        	end
        	doTeleportThing(getThingFromPos({x = 32842, y = 32340, z = 9, stackpos = 1}).uid, {x = position.x, y = position.y + 7, z = position.z})
    	end
    	return true]]--
end

function onStepOut(cid, item, position, fromPosition)
	doTransformItem(item.uid, 426)
end