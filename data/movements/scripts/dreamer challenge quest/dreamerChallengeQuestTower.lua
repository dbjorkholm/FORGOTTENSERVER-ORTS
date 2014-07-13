local teleports = {
	[3048] = Town(4):getTemplePosition(), -- Carlin
	[3049] = Town(2):getTemplePosition(), -- Thais
	[3050] = Position(32750, 32344, 14), -- Dream Realm
	[3051] = Town(3):getTemplePosition(), -- Kazo
	[3052] = Town(5):getTemplePosition(), -- Ab
	[3053] = Position(32181, 32436, 7), -- Fibula
	[3054] = Town(10):getTemplePosition(), -- Darashia
	[3055] = Town(9):getTemplePosition(), -- Ankrahmun
	[3056] = Position(32417, 32139, 15), -- Mintwalin
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	if player:getItemCount(5022) >= 1 then
		if item.uid >= 3048 and item.uid <= 3050 then
			if(player:getStorageValue(66) >= 1 or player:getStorageValue(67) >= 1) then
				player:removeItem(5022, 1)
				player:teleportTo(teleports[item.uid])
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			else
				player:teleportTo(fromPosition)
			end
		elseif item.uid >= 3051 and item.uid <= 3053 then
			if(player:getStorageValue(66) >= 2 or player:getStorageValue(67) >= 2) then
				player:removeItem(5022, 1)
				player:teleportTo(teleports[item.uid])
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			else
				player:teleportTo(fromPosition)
			end
		elseif item.uid >= 3054 and item.uid <= 3056 then
			if(player:getStorageValue(66) >= 4 or player:getStorageValue(67) >= 4) then
				player:removeItem(5022, 1)
				player:teleportTo(teleports[item.uid])
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			else
				player:teleportTo(fromPosition)
			end
		end
	else
		player:teleportTo(fromPosition)
	end
	return true
end
