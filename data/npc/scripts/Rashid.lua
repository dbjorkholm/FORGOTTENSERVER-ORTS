local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function getTable()
local list = 
{
	{name = 'Abyss Hammer',			id = 7414,		sell = 20000,		buy = 0},
	{name = 'Amber Staff',			id = 7426,		sell = 8000,		buy = 0},
	{name = 'Ancient Amulet',		id = 2142,		sell = 200,			buy = 0},
	{name = 'Assassin Dagger',		id = 7404,		sell = 20000,		buy = 0},
	{name = 'Royal Helmet',			id = 2498,		sell = 30000,		buy = 0},
	{name = 'Bandana',				id = 5917,		sell = 150,			buy = 0},
	{name = 'Beastslayer axe',		id = 3962,		sell = 1500,		buy = 0},
	{name = 'Beetle Necklace',		id = 11374,		sell = 1500,		buy = 0},
	{name = 'Berserker',			id = 7403,		sell = 40000,		buy = 0},
	{name = 'Blacksteel Sword',		id = 7406,		sell = 6000,		buy = 0},
	{name = 'Blessed Sceptre',		id = 7429,		sell = 40000,		buy = 0},
	{name = 'Bone Shield',			id = 2541,		sell = 80,			buy = 0},
	{name = 'Bonelord Helmet',		id = 3972,		sell = 7500,		buy = 0},
	{name = 'Brutetamer\'s Staff',	id = 7379,		sell = 1500,		buy = 0},
	{name = 'Buckle',				id = 20109,		sell = 7000,		buy = 0},
	{name = 'Castle Shield',		id = 2535,		sell = 5000,		buy = 0},
	{name = 'Chain Bolter',			id = 8850,		sell = 40000,		buy = 0},
	{name = 'Chaos Mace',			id = 7427,		sell = 9000,		buy = 0},
	{name = 'Cobra Crown',			id = 12630,		sell = 50000,		buy = 0},
	{name = 'Coconut Shoes',		id = 9931,		sell = 500,			buy = 0},
	{name = 'Composite Hornbow',	id = 8855,		sell = 25000,		buy = 0},
	{name = 'Cranial Basher',		id = 7415,		sell = 30000,		buy = 0},
	{name = 'Crocodile Boots',		id = 3982,		sell = 1000,		buy = 0},
	{name = 'Crystal Crossbow',		id = 18453,		sell = 35000,		buy = 0},
	{name = 'Crystal Mace',			id = 2445,		sell = 12000,		buy = 0},
	{name = 'Crystal Necklace',		id = 2125,		sell = 400,			buy = 0},
	{name = 'Crystal Ring',			id = 2124,		sell = 250,			buy = 0},
	{name = 'Crystal Sword',		id = 7449,		sell = 600,			buy = 0},
	{name = 'Crystalline Armor',	id = 8878,		sell = 16000,		buy = 0},
	{name = 'Daramian Mace',		id = 2439,		sell = 110,			buy = 0},
	{name = 'Daramian Waraxe',		id = 2440,		sell = 1000,		buy = 0},
	{name = 'Dark Shield',			id = 2521,		sell = 400,			buy = 0},
	{name = 'Death Ring',			id = 6300,		sell = 1000,		buy = 0},
	{name = 'Demon Shield',			id = 2520,		sell = 30000,		buy = 0},
	{name = 'Demonbone Amulet',		id = 2136,		sell = 32000,		buy = 0},
	{name = 'Demonrage Sword',		id = 7382,		sell = 36000,		buy = 0},
	{name = 'Devil Helmet',			id = 2462,		sell = 1000,		buy = 0},
	{name = 'Diamond Sceptre',		id = 7387,		sell = 3000,		buy = 0},
	{name = 'Divine Plate',			id = 8885,		sell = 55000,		buy = 0},
	{name = 'Djinn Blade',			id = 2451,		sell = 15000,		buy = 0},
	{name = 'Doll',					id = 2110,		sell = 200,			buy = 0},
	{name = 'Dragon Scale Mail',	id = 2492,		sell = 40000,		buy = 0},
	{name = 'Dragon Slayer',		id = 7402,		sell = 15000,		buy = 0},
	{name = 'Dragonbone Staff',		id = 7430,		sell = 3000,		buy = 0},
	{name = 'Dreaded Cleaver',		id = 7419,		sell = 10000,		buy = 0},
	{name = 'Dwarven Armor',		id = 2503,		sell = 30000,		buy = 0},
	{name = 'Earth Cranial Basher',	id = 7866,		sell = 30000,		buy = 0},
	{name = 'Earth Dragon Slayer',	id = 7858,		sell = 15000,		buy = 0},
	{name = 'Earth Headchopper',	id = 7862,		sell = 6000,		buy = 0},
	{name = 'Earth Heroic axe',		id = 7861,		sell = 30000,		buy = 0},
	{name = 'Earth Mystic Blade',	id = 7856,		sell = 30000,		buy = 0},
	{name = 'Earth Orcish Maul',	id = 7867,		sell = 6000,		buy = 0},
	{name = 'Earth Relic Sword',	id = 7855,		sell = 25000,		buy = 0},
	{name = 'Earth War axe',		id = 7863,		sell = 12000,		buy = 0},
	{name = 'Elvish Bow',			id = 7438,		sell = 2000,		buy = 0},
	{name = 'Emerald Bangle',		id = 2127,		sell = 800,			buy = 0},
	{name = 'Energy Cranial Basher',id = 7881,		sell = 30000,		buy = 0},
	{name = 'Energy Dragon Slayer',	id = 7873,		sell = 15000,		buy = 0},
	{name = 'Energy Headchopper',	id = 7877,		sell = 6000,		buy = 0},
	{name = 'Energy Heroic axe',	id = 7876,		sell = 30000,		buy = 0},
	{name = 'Energy Mystic Blade',	id = 7871,		sell = 30000,		buy = 0},
	{name = 'Energy Orcish Maul',	id = 7882,		sell = 6000,		buy = 0},
	{name = 'Energy Relic Sword',	id = 7870,		sell = 25000,		buy = 0},
	{name = 'Energy War axe',		id = 7878,		sell = 12000,		buy = 0},
	{name = 'Epee',					id = 2438,		sell = 8000,		buy = 0},
	{name = 'Fiery Cranial Basher',	id = 7756,		sell = 30000,		buy = 0},
	{name = 'Fiery Dragon Slayer',	id = 7748,		sell = 15000,		buy = 0},
	{name = 'Fiery Headchopper',	id = 7752,		sell = 6000,		buy = 0},
	{name = 'Fiery Heroic axe',		id = 7751,		sell = 30000,		buy = 0},
	{name = 'Fiery Mystic Blade',	id = 7746,		sell = 30000,		buy = 0},
	{name = 'Fiery Orcish Maul',	id = 7757,		sell = 6000,		buy = 0},
	{name = 'Fiery Relic Sword',	id = 7745,		sell = 25000,		buy = 0},
	{name = 'Fiery War axe',		id = 7753,		sell = 12000,		buy = 0},
	{name = 'Flower Dress',			id = 9929,		sell = 1000,		buy = 0},
	{name = 'Flower Wreath',		id = 9927,		sell = 500,			buy = 0},
	{name = 'Fur Boots',			id = 7457,		sell = 2000,		buy = 0},
	{name = 'Furry Club',			id = 7432,		sell = 1000,		buy = 0},
	{name = 'Glacier Amulet',		id = 7888,		sell = 1500,		buy = 0},
	{name = 'Glacier Kilt',			id = 7896,		sell = 11000,		buy = 0},
	{name = 'Glacier Mask',			id = 7902,		sell = 2500,		buy = 0},
	{name = 'Glacier Robe',			id = 7897,		sell = 11000,		buy = 0},
	{name = 'Glacier Shoes',		id = 7892,		sell = 2500,		buy = 0},
	{name = 'Gold Ring',			id = 2179,		sell = 8000,		buy = 0},
	{name = 'Golden Armor',			id = 2466,		sell = 20000,		buy = 0},
	{name = 'Golden Legs',			id = 2470,		sell = 30000,		buy = 0},
	{name = 'Guardian Halberd',		id = 2427,		sell = 11000,		buy = 0},
	{name = 'Hammer of Wrath',		id = 2444,		sell = 30000,		buy = 0},
	{name = 'Headchopper',			id = 7380,		sell = 6000,		buy = 0},
	{name = 'Heavy Mace',			id = 2452,		sell = 50000,		buy = 0},
	{name = 'Heavy Machete',		id = 2442,		sell = 90,			buy = 0},
	{name = 'Heavy Trident',		id = 13838,		sell = 2000,		buy = 0},
	{name = 'Helmet of the Lost',	id = 20132,		sell = 2000,		buy = 0},
	{name = 'Heroic axe',			id = 7389,		sell = 30000,		buy = 0},
	{name = 'Hibiscus Dress',		id = 8873,		sell = 3000,		buy = 0},
	{name = 'Icy Blacksteel Sword',	id = 7766,		sell = 6000,		buy = 0},
	{name = 'Icy Cranial Basher',	id = 7775,		sell = 30000,		buy = 0},
	{name = 'Icy Dragon Slayer',	id = 7767,		sell = 15000,		buy = 0},
	{name = 'Icy Headchopper',		id = 7771,		sell = 6000,		buy = 0},
	{name = 'Icy Heroic axe',		id = 7770,		sell = 30000,		buy = 0},
	{name = 'Icy Mystic Blade',		id = 7765,		sell = 30000,		buy = 0},
	{name = 'Icy Orcish Maul',		id = 7776,		sell = 6000,		buy = 0},
	{name = 'Icy Relic Sword',		id = 7764,		sell = 25000,		buy = 0},
	{name = 'Icy War axe',			id = 7772,		sell = 12000,		buy = 0},
	{name = 'Jade Hammer',			id = 7422,		sell = 25000,		buy = 0},
	{name = 'Krimhorn Helmet',		id = 7461,		sell = 200,			buy = 0},
	{name = 'Lavos Armor',			id = 8877,		sell = 16000,		buy = 0},
	{name = 'Leaf Legs',			id = 9928,		sell = 500,			buy = 0},
	{name = 'Leopard Armor',		id = 3968,		sell = 1000,		buy = 0},
	{name = 'Leviathan\'s Amulet',	id = 10220,		sell = 3000,		buy = 0},
	{name = 'Light Shovel',			id = 5710,		sell = 300,			buy = 0},
	{name = 'Lightning Boots',		id = 7893,		sell = 2500,		buy = 0},
	{name = 'Lightning Headband',	id = 7901,		sell = 2500,		buy = 0},
	{name = 'Lightning Legs',		id = 7895,		sell = 11000,		buy = 0},
	{name = 'Lightning Pendant',	id = 7889,		sell = 1500,		buy = 0},
	{name = 'Lightning Robe',		id = 7898,		sell = 11000,		buy = 0},
	{name = 'Lunar Staff',			id = 7424,		sell = 5000,		buy = 0},
	{name = 'Magic Plate Armor',	id = 2472,		sell = 90000,		buy = 0},
	{name = 'Magma Amulet',			id = 7890,		sell = 1500,		buy = 0},
	{name = 'Magma Boots',			id = 7891,		sell = 2500,		buy = 0},
	{name = 'Magma Coat',			id = 7899,		sell = 11000,		buy = 0},
	{name = 'Magma Legs',			id = 7894,		sell = 11000,		buy = 0},
	{name = 'Magma Monocle',		id = 7900,		sell = 2500,		buy = 0},
	{name = 'Mammoth Fur Cape',		id = 7463,		sell = 6000,		buy = 0},
	{name = 'Mammoth Fur Shorts',	id = 7464,		sell = 850,			buy = 0},
	{name = 'Mammoth Whopper',		id = 7381,		sell = 300,			buy = 0},
	{name = 'Mastermind Shield',	id = 2514,		sell = 50000,		buy = 0},
	{name = 'Medusa Shield',		id = 2536,		sell = 9000,		buy = 0},
	{name = 'Mercenary Sword',		id = 7386,		sell = 12000,		buy = 0},
	{name = 'Mycological Bow',		id = 18454,		sell = 35000,		buy = 0},
	{name = 'Mystic Blade',			id = 7384,		sell = 30000,		buy = 0},
	{name = 'Naginata',				id = 2426,		sell = 2000,		buy = 0},
	{name = 'Nightmare Blade',		id = 7418,		sell = 35000,		buy = 0},
	{name = 'Noble axe',			id = 7456,		sell = 10000,		buy = 0},
	{name = 'Norse Shield',			id = 7460,		sell = 1500,		buy = 0},
	{name = 'Orcish Maul',			id = 7392,		sell = 6000,		buy = 0},
	{name = 'Pair of Iron Fists',	id = 20108,		sell = 4000,		buy = 0},
	{name = 'Paladin Armor',		id = 8891,		sell = 15000,		buy = 0},
	{name = 'Patched Boots',		id = 2641,		sell = 2000,		buy = 0},
	{name = 'Pharaoh Sword',		id = 2446,		sell = 23000,		buy = 0},
	{name = 'Pirate Boots',			id = 5462,		sell = 3000,		buy = 0},
	{name = 'Pirate Hat',			id = 6096,		sell = 1000,		buy = 0},
	{name = 'Pirate Knee Breeches',	id = 5918,		sell = 200,			buy = 0},
	{name = 'Pirate Shirt',			id = 6095,		sell = 500,			buy = 0},
	{name = 'Pirate Voodoo Doll',	id = 5810,		sell = 500,			buy = 0},
	{name = 'Platinum Amulet',		id = 2171,		sell = 2500,		buy = 0},
	{name = 'Ragnir Helmet',		id = 7462,		sell = 400,			buy = 0},
	{name = 'Relic Sword',			id = 7383,		sell = 25000,		buy = 0},
	{name = 'Ring of the Sky',		id = 2123,		sell = 30000,		buy = 0},
	{name = 'Royal axe',			id = 7434,		sell = 40000,		buy = 0},
	{name = 'Ruby Necklace',		id = 2133,		sell = 2000,		buy = 0},
	{name = 'Ruthless axe',			id = 6553,		sell = 45000,		buy = 0},
	{name = 'Sacred Tree Amulet',	id = 10219,		sell = 3000,		buy = 0},
	{name = 'Sapphire Hammer',		id = 7437,		sell = 7000,		buy = 0},
	{name = 'Scarab Amulet',		id = 2135,		sell = 200,			buy = 0},
	{name = 'Scarab Shield',		id = 2540,		sell = 2000,		buy = 0},
	{name = 'Shockwave Amulet',		id = 10221,		sell = 3000,		buy = 0},
	{name = 'Silver Brooch',		id = 2134,		sell = 150,			buy = 0},
	{name = 'Silver Dagger',		id = 2402,		sell = 500,			buy = 0},
	{name = 'Skull Helmet',			id = 5741,		sell = 40000,		buy = 0},
	{name = 'Skullcracker Armor',	id = 8889,		sell = 18000,		buy = 0},
	{name = 'Spiked Squelcher',		id = 7452,		sell = 5000,		buy = 0},
	{name = 'Steel Boots',			id = 2645,		sell = 30000,		buy = 0},
	{name = 'Swamplair Armor',		id = 8880,		sell = 16000,		buy = 0},
	{name = 'Taurus Mace',			id = 7425,		sell = 500,			buy = 0},
	{name = 'Tempest Shield',		id = 2542,		sell = 35000,		buy = 0},
	{name = 'Terra Amulet',			id = 7887,		sell = 1500,		buy = 0},
	{name = 'Terra Boots',			id = 7886,		sell = 2500,		buy = 0},
	{name = 'Terra Hood',			id = 7903,		sell = 2500,		buy = 0},
	{name = 'Terra Legs',			id = 7885,		sell = 11000,		buy = 0},
	{name = 'Terra Mantle',			id = 7884,		sell = 11000,		buy = 0},
	{name = 'The Justice Seeker',	id = 7390,		sell = 40000,		buy = 0},
	{name = 'Tortoise Shield',		id = 6131,		sell = 150,			buy = 0},
	{name = 'Vile axe',				id = 7388,		sell = 30000,		buy = 0},
	{name = 'Voodoo Doll',			id = 2322,		sell = 400,			buy = 0},
	{name = 'War axe',				id = 2454,		sell = 12000,		buy = 0},
	{name = 'War Horn',				id = 2079,		sell = 8000,		buy = 0},
	{name = 'Witch Hat',			id = 10570,		sell = 5000,		buy = 0},
	{name = 'Wyvern Fang',			id = 7408,		sell = 1500,		buy = 0}
}
return list
end

local function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local player = Player(cid)
	if(msgcontains(msg, "mission")) then
		if(os.date("%A") == "Monday") then
			if(player:getStorageValue(Rashid.MissionStart) < 1) then
				npcHandler:say("Well, you could attempt the mission to become a recognised trader, but it requires a lot of travelling. Are you willing to try?", cid)
				npcHandler.topic[cid] = 1
			elseif(player:getStorageValue(Rashid.MissionStart) == 1) then
				npcHandler:say("Have you managed to obtain a rare deer trophy for my customer?", cid)
				npcHandler.topic[cid] = 3
			end
		elseif(os.date("%A") == "Tuesday") then
			if(player:getStorageValue(Rashid.MissionStart) == 2 and player:getStorageValue(Rashid.MissionStart+1) < 1 ) then
				npcHandler:say("So, my friend, are you willing to proceed to the next mission to become a recognised trader?", cid)
				npcHandler.topic[cid] = 4
			elseif(player:getStorageValue(Rashid.MissionStart + 1) == 4) then
				npcHandler:say("Did you bring me the package?", cid)
				npcHandler.topic[cid] = 6
			end
		elseif(os.date("%A") == "Wednesday") then
			if(player:getStorageValue(Rashid.MissionStart + 1) == 5 and player:getStorageValue(Rashid.MissionStart + 2) < 1 ) then
				npcHandler:say("So, my friend, are you willing to proceed to the next mission to become a recognised trader?", cid)
				npcHandler.topic[cid] = 7
			elseif(player:getStorageValue(Rashid.MissionStart + 2) == 2) then
				npcHandler:say("Have you brought the cheese?", cid)
				npcHandler.topic[cid] = 9
			end
		elseif(os.date("%A") == "Thursday") then
			if(player:getStorageValue(Rashid.MissionStart + 2) == 3 and player:getStorageValue(Rashid.MissionStart + 3) < 1) then
				npcHandler:say("So, my friend, are you willing to proceed to the next mission to become a recognised trader?", cid)
				npcHandler.topic[cid] = 10
			elseif(player:getStorageValue(Rashid.MissionStart + 3) == 2) then
				npcHandler:say("Have you brought the vase?", cid)
				npcHandler.topic[cid] = 12
			end
		elseif(os.date("%A") == "Friday") then
			if(player:getStorageValue(Rashid.MissionStart + 3) == 3 and player:getStorageValue(Rashid.MissionStart + 4) < 1) then
				npcHandler:say("So, my friend, are you willing to proceed to the next mission to become a recognised trader?", cid)
				npcHandler.topic[cid] = 13
			elseif(player:getStorageValue(Rashid.MissionStart + 4) == 2) then
				npcHandler:say("Have you brought a cheap but good crimson sword?", cid)
				npcHandler.topic[cid] = 15
			end
		elseif(os.date("%A") == "Saturday") then
			if(player:getStorageValue(Rashid.MissionStart + 4) == 3 and player:getStorageValue(Rashid.MissionStart + 5) < 1) then
				npcHandler:say("So, my friend, are you willing to proceed to the next mission to become a recognised trader?", cid)
				npcHandler.topic[cid] = 16
			elseif(player:getStorageValue(Rashid.MissionStart + 5) == 1) then
				npcHandler:say("Have you brought me a gold fish??", cid)
				npcHandler.topic[cid] = 18
			end
		elseif(os.date("%A") == "Sunday") then
			if(player:getStorageValue(Rashid.MissionStart + 5) == 2 and player:getStorageValue(Rashid.MissionStart + 6) < 1) then
				npcHandler:say("Ah, right. <ahem> I hereby declare you - one of my recognised traders! Feel free to offer me your wares!", cid)
				player:setStorageValue(Rashid.MissionStart + 6, 1)
				--player:AddArchie(id or name)
				npcHandler.topic[cid] = 0
			end
		end
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
		
			npcHandler:say(
			{
			"Very good! I need talented people who are able to handle my wares with care, find good offers and the like, so I'm going to test you. ...",
			"First, I'd like to see if you can dig up rare wares. Something like a ... mastermind shield! ...",
			"Haha, just kidding, fooled you there, didn't I? Always control your nerves, that's quite important during bargaining. ...",
			"Okay, all I want from you is one of these rare deer trophies. I have a customer here in Svargrond who ordered one, so I'd like you to deliver it tome while I'm in Svargrond. ...",
			"Everything clear and understood?"
			}, cid)
			
			npcHandler.topic[cid] = 2
		elseif(npcHandler.topic[cid] == 2) then
			npcHandler:say("Fine. Then get a hold of that deer trophy and bring it to me while I'm in Svargrond. Just ask me about your mission.", cid)
			player:setStorageValue(Rashid.MissionStart, 1)
			npcHandler.topic[cid] = 0
		elseif(npcHandler.topic[cid] == 3) then
			if(player:getItemCount(7397) >= 1) then
				player:removeItem(7397, 1)
				npcHandler:say("Well done! I'll take that from you. <snags it> Come see me another day, I'll be busy for a while now. ", cid)
				player:setStorageValue(Rashid.MissionStart, 2)
				npcHandler.topic[cid] = 0
			end
		elseif(npcHandler.topic[cid] == 4) then
			npcHandler:say(
			{
			"Alright, that's good to hear. From you as my trader and deliveryman, I expect more than finding rare items. ...",
			"You also need to be able to transport heavy wares, weaklings won't get far here. I have ordered a special package from Edron. ...",
			"Pick it up from Willard and bring it back to me while I'm in Liberty Bay. Everything clear and understood?"
			}, cid)
			npcHandler.topic[cid] = 5
		elseif(npcHandler.topic[cid] == 5) then
			npcHandler:say("Fine. Then off you go, just ask Willard about the 'package for Rashid'.", cid)
			player:setStorageValue(Rashid.MissionStart + 1, 1)
			npcHandler.topic[cid] = 0
		elseif(npcHandler.topic[cid] == 6) then
			if(player:getItemCount(7503) >= 1) then
				player:removeItem(7503, 1)
				npcHandler:say("Great. Just place it over there - yes, thanks, that's it. Come see me another day, I'll be busy for a while now. ", cid)
				player:setStorageValue(Rashid.MissionStart + 1, 5)
				npcHandler.topic[cid] = 0
			end
		elseif(npcHandler.topic[cid] == 7) then
			npcHandler:say(
			{
			"Well, that's good to hear. From you as my trader and deliveryman, I expect more than carrying heavy packages. ...",
			"You also need to be fast and deliver wares in time. I have ordered a very special cheese wheel made from Darashian milk. ...",
			"Unfortunately, the high temperature in the desert makes it rot really fast, so it must not stay in the sun for too long. ...",
			"I'm also afraid that you might not be able to use ships because of the smell of the cheese. ...",
			"Please get the cheese from Miraia and bring it to me while I'm in Port Hope. Everything clear and understood?"
			}, cid)
			npcHandler.topic[cid] = 8
		elseif(npcHandler.topic[cid] == 8) then
			npcHandler:say("Okay, then please find Miraia in Darashia and ask her about the {'scarab cheese'}.", cid)
			player:setStorageValue(Rashid.MissionStart + 2, 1)
			npcHandler.topic[cid] = 0
		elseif(npcHandler.topic[cid] == 9) then
			if(player:getItemCount(8112) >= 1) then
				player:removeItem(8112, 1)
				--if (player:getStorageValue(ExplorerSocietySTORAGE) == 1) then
					--player:AddArchie(Just in Time)
				--end
				npcHandler:say("Mmmhh, the lovely odeur of scarab cheese! I really can't understand why most people can't stand it. Thanks, well done! ", cid)
				player:setStorageValue(Rashid.MissionStart + 2, 3)
				npcHandler.topic[cid] = 0
			end
		elseif(npcHandler.topic[cid] == 10) then
			npcHandler:say(
			{
			"Well, that's good to hear. From you as my trader and deliveryman, I expect more than bringing stinky cheese. ...",
			"I wonder if you are able to deliver goods so fragile they almost break when looked at. ...",
			"I have ordered a special elven vase from Briasol in Ab'Dendriel. Get it from him and don't even touch it, just bring it to me while I'm in Ankrahmun. Everything clear and understood?"
			}, cid)
			npcHandler.topic[cid] = 11
		elseif(npcHandler.topic[cid] == 11) then
			npcHandler:say("Okay, then please find {Briasol} in {Ab'Dendriel} and ask for a {'fine vase'}.", cid)
			player:setStorageValue(Rashid.MissionStart + 3, 1)
			player:addMoney(1000)
			npcHandler.topic[cid] = 0
		elseif(npcHandler.topic[cid] == 12) then
			if(player:getItemCount(8760) >= 1) then
				player:removeItem(8760, 1)
				npcHandler:say("I'm surprised that you managed to bring this vase without a single crack. That was what I needed to know, thank you. ", cid)
				player:setStorageValue(Rashid.MissionStart + 3, 3)
				npcHandler.topic[cid] = 0
			end
		elseif(npcHandler.topic[cid] == 13) then
			npcHandler:say(
			{
			"Fine! There's one more skill that I need to test and which is cruicial for a successful trader. ...",
			"Of course you must be able to haggle, else you won't survive long in this business. To make things as hard as possible for you, I have the perfect trade partner for you. ...",
			"Dwarves are said to be the most stubborn of all traders. Travel to {Kazordoon} and try to get the smith {Uzgod} to sell a {crimson sword} to you. ...",
			"Of course, it has to be cheap. Don't come back with anything more expensive than 400 gold. ...",
			"And the quality must not suffer, of course! Everything clear and understood?",
			"Dwarves are said to be the most stubborn of all traders. Travel to Kazordoon and try to get the smith Uzgod to sell a crimson sword to you. ..."
			}, cid)
			npcHandler.topic[cid] = 14
		elseif(npcHandler.topic[cid] == 14) then
			npcHandler:say("Okay, I'm curious how you will do with {Uzgod}. Good luck!", cid)
			player:setStorageValue(Rashid.MissionStart + 4, 1)
			npcHandler.topic[cid] = 0
		elseif(npcHandler.topic[cid] == 15) then
			if(player:getItemCount(7385) >= 1) then
				player:removeItem(7385, 1)
				npcHandler:say("Ha! You are clever indeed, well done! I'll take this from you. Come see me tomorrow, I think we two might get into business after all.", cid)
				player:setStorageValue(Rashid.MissionStart + 4, 3)
				npcHandler.topic[cid] = 0
			end
		elseif(npcHandler.topic[cid] == 16) then
			npcHandler:say(
			{
			"My friend, it seems you have already learnt a lot about the art of trading. I think you are more than worthy to become a recognised trader. ...",
			"There is just one little favour that I would ask from you... something personal, actually, forgive my boldness. ...",
			"I have always dreamed to have a small pet, one that I could take with me and which wouldn't cause problems. ...",
			"Could you - just maybe - bring me a small goldfish in a bowl? I know that you would be able to get one, wouldn't you?"
			}, cid)
			npcHandler.topic[cid] = 17
		elseif(npcHandler.topic[cid] == 17) then
			npcHandler:say("Thanks so much! I'll be waiting eagerly for your return then.", cid)
			player:setStorageValue(Rashid.MissionStart + 5, 1)
			npcHandler.topic[cid] = 0
		elseif(npcHandler.topic[cid] == 18) then
			if(player:getItemCount(8766) >= 1) then
				player:removeItem(8766, 1)
				npcHandler:say("Thank you!! Ah, this makes my day! I'll take the rest of the day off to get to know this little guy. Come see me tomorrow, if you like.", cid)
				player:setStorageValue(Rashid.MissionStart + 5, 2)
				npcHandler.topic[cid] = 0
			end
		end
	end
	return true
end

local function onTradeRequest(cid)
	TradeRequest(cid, npcHandler, getTable(), Rashid, 1)
end


npcHandler:setCallback(CALLBACK_ONTRADEREQUEST, onTradeRequest)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
