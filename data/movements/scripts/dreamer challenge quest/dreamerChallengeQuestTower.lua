local teleports = {
	[3048] = getTownTemplePosition(4), -- Carlin
	[3049] = getTownTemplePosition(2), -- Thais
	[3050] = {x = 32750, y = 32344, z = 14}, -- Dream Realm
	[3051] = getTownTemplePosition(3), -- Kazo
	[3052] = getTownTemplePosition(5), -- Ab
	[3053] = {x = 32181, y = 32436, z = 7}, -- Fibula
	[3054] = getTownTemplePosition(10), -- Darashia
	[3055] = getTownTemplePosition(9), -- Ankrahmun
	[3056] = {x = 32417, y = 32139, z = 15}, -- Mintwalin
}

function onStepIn(cid, item, position, lastPosition)
	if(getPlayerItemCount(cid, 5022) >= 1) then
		if(item.uid >= 3048 and item.uid <= 3050) then
			if(getPlayerStorageValue(cid, 66) >= 1 or getPlayerStorageValue(cid, 67) >= 1) then
				doPlayerRemoveItem(cid, 5022, 1)
				doTeleportThing(cid, teleports[item.uid])
				doSendMagicEffect(teleports[item.uid], CONST_ME_TELEPORT)
			else
				doTeleportThing(cid, lastPosition)
			end
		elseif(item.uid >= 3051 and item.uid <= 3053) then
			if(getPlayerStorageValue(cid, 66) >= 2 or getPlayerStorageValue(cid, 67) >= 2) then
				doPlayerRemoveItem(cid, 5022, 1)
				doTeleportThing(cid, teleports[item.uid])
				doSendMagicEffect(teleports[item.uid], CONST_ME_TELEPORT)
			else
				doTeleportThing(cid, lastPosition)
			end
		elseif(item.uid >= 3054 and item.uid <= 3056) then
			if(getPlayerStorageValue(cid, 66) >= 4 or getPlayerStorageValue(cid, 67) >= 4) then
				doPlayerRemoveItem(cid, 5022, 1)
				doTeleportThing(cid, teleports[item.uid])
				doSendMagicEffect(teleports[item.uid], CONST_ME_TELEPORT)
			else
				doTeleportThing(cid, lastPosition)
			end
		end
	else
		doTeleportThing(cid, lastPosition)
	end
	return true
end