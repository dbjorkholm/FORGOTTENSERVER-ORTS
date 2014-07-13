local teleports2 = {
	[2150] = {text = "Entering Ushuriel's ward.", newPos = {x = 33158, y = 31728, z = 11}, storage = 0}, -- to ushuriel ward
}

local teleports = {
	[2151] = {boss = true, text = "Entering the Crystal Caves.", bossStorage = 200, newPos = {x = 33069, y = 31782, z = 13}, storage = 1}, -- from ushuriel ward
	[2152] = {text = "Escaping back to the Retreat.", newPos = {x = 33165, y = 31709, z = 14}}, -- from crystal caves
	[2153] = {text = "Entering the Crystal Caves.", newPos = {x = 33069, y = 31782, z = 13}, storage = 1}, -- to crystal caves
	[2154] = {text = "Entering the Sunken Caves.", newPos = {x = 33169, y = 31755, z = 13}}, -- to sunken caves
	[2155] = {text = "Entering the Mirror Maze of Madness.", newPos = {x = 33065, y = 31772, z = 10}}, -- from sunken caves
	[2156] = {text = "Entering Zugurosh's ward.", newPos = {x = 33124, y = 31692, z = 11}}, -- to zugurosh ward
	[2157] = {boss = true, text = "Entering the Blood Halls.", bossStorage = 201, newPos = {x = 33372, y = 31613, z = 14}, storage = 2}, -- from zugurosh ward
	[2158] = {text = "Escaping back to the Retreat.", newPos = {x = 33165, y = 31709, z = 14}}, -- from blood halls
	[2159] = {text = "Entering the Blood Halls.", newPos = {x = 33372, y = 31613, z = 14}, storage = 2}, -- to blood halls
	[2160] = {text = "Entering the Foundry.", newPos = {x = 33356, y = 31589, z = 11}}, -- to foundry
	[2161] = {text = "Entering Madareth's ward.", newPos = {x = 33197, y = 31767, z = 11}}, -- to madareth ward
	[2162] = {boss = true, text = "Entering the Vats.", bossStorage = 202, newPos = {x = 33153, y = 31782, z = 12}, storage = 3}, -- from madareth ward
	[2163] = {text = "Escaping back to the Retreat.", newPos = {x = 33165, y = 31709, z = 14}}, -- from vats
	[2164] = {text = "Entering the Vats.", newPos = {x = 33153, y = 31782, z = 12}, storage = 3}, -- to vats
	[2165] = {text = "Entering the Battlefield.", newPos = {x = 33250, y = 31632, z = 13}}, -- to battlefield
	[2166] = {text = "Entering the Vats.", newPos = {x = 33233, y = 31758, z = 12}}, -- from battlefield
	[2167] = {text = "Entering the Demon Forge.", newPos = {x = 33232, y = 31733, z = 11}}, -- to brothers ward
	[2168] = {boss = true, text = "Entering the Arcanum.", bossStorage = 203, newPos = {x = 33038, y = 31753, z = 15}, storage = 4}, -- from demon forge
	[2169] = {text = "Escaping back to the Retreat.", newPos = {x = 33165, y = 31709, z = 14}}, -- from arcanum
	[2170] = {text = "Entering the Arcanum.", newPos = {x = 33038, y = 31753, z = 15}, storage = 4}, -- to arcanum
	[2171] = {text = "Entering the Soul Wells.", newPos = {x = 33093, y = 31575, z = 11}}, -- to soul wells
	[2172] = {text = "Entering the Arcanum.", newPos = {x = 33186, y = 31759, z = 15}}, -- from soul wells
	[2173] = {text = "Entering the Annihilon's ward.", newPos = {x = 33197, y = 31703, z = 11}}, -- to annihilon ward
	[2174] = {boss = true, text = "Entering the Hive.", bossStorage = 204, newPos = {x = 33199, y = 31686, z = 12}, storage = 5}, -- from annihilon ward
	[2175] = {text = "Escaping back to the Retreat.", newPos = {x = 33165, y = 31709, z = 14}}, -- from hive
	[2176] = {text = "Entering the Hive.", newPos = {x = 33199, y = 31686, z = 12}, storage = 5}, -- to hive
	[2177] = {text = "Entering the Hellgorak's ward.", newPos = {x = 33104, y = 31734, z = 11}}, -- to hellgorak ward
	[2178] = {boss = true, text = "Entering the Shadow Nexus. Abandon all Hope.", bossStorage = 205, newPos = {x = 33110, y = 31682, z = 12}, storage = 6}, -- from hellgorak ward
	[2179] = {text = "Escaping back to the Retreat.", newPos = {x = 33165, y = 31709, z = 14}}, -- from shadow nexus
	[2180] = {text = "Entering the Blood Halls.", newPos = {x = 33357, y = 31589, z = 12}} -- from foundry to blood halls
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	if (item.uid == 2150) then
		if(player:getStorageValue(Storage.TheInquisition.EnterTeleport) <= teleports2[item.uid].storage) then
			player:setStorageValue(Storage.TheInquisition.EnterTeleport, teleports2[item.uid].storage)
		end
		player:teleportTo(teleports2[item.uid].newPos)
		Position(teleports2[item.uid].newPos):sendMagicEffect(CONST_ME_TELEPORT)
		player:say(teleports2[item.uid].text, TALKTYPE_MONSTER_SAY)
	return true	
	end
	if(teleports[item.uid].boss) then
		if(getGlobalStorageValue(teleports[item.uid].bossStorage) == 2) then
			if(player:getStorageValue(Storage.TheInquisition.EnterTeleport) <= teleports[item.uid].storage) then
				player:setStorageValue(Storage.TheInquisition.EnterTeleport, teleports[item.uid].storage)
			end
			player:teleportTo(teleports[item.uid].newPos)
			Position(teleports[item.uid].newPos):sendMagicEffect(CONST_ME_TELEPORT)
			player:say(teleports[item.uid].text, TALKTYPE_MONSTER_SAY)
		else
			player:teleportTo({x = 33165, y = 31709, z = 14})
			Position({x = 33165, y = 31709, z = 14}):sendMagicEffect(CONST_ME_TELEPORT)
			player:say("Escaping back to the Retreat.", TALKTYPE_MONSTER_SAY)
		end
		return true
	end
	
	if(teleports[item.uid].storage) then
		if(player:getStorageValue( Storage.TheInquisition.EnterTeleport) >= teleports[item.uid].storage) then
			player:teleportTo(teleports[item.uid].newPos)
			Position(teleports[item.uid].newPos):sendMagicEffect(CONST_ME_TELEPORT)
			player:say(teleports[item.uid].text, TALKTYPE_MONSTER_SAY)
		else
			player:teleportTo(fromPosition)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:say('You don\'t have enough energy to enter this portal', TALKTYPE_MONSTER_SAY)
		end
		return true
	end

	if(teleports[item.uid]) then
		player:teleportTo(teleports[item.uid].newPos)
		Position(teleports[item.uid].newPos):sendMagicEffect(CONST_ME_TELEPORT)
		player:say(teleports[item.uid].text, TALKTYPE_MONSTER_SAY)
		return true
	end
	return true
end
