local CHAIN_ARMOR, SCALE_ARMOR, BRASS_ARMOR, PLATE_ARMOR, KNIGHT_ARMOR, PALADIN_ARMOR, CROWN_ARMOR, GOLDEN_ARMOR, DRAGON_SCALE_MAIL, MAGIC_PLATE_ARMOR = 2464, 2483, 2465, 2463, 2476, 8891, 2487, 2466, 2492, 2472
local STUDDED_LEGS, CHAIN_LEGS, BRASS_LEGS, PLATE_LEGS, KNIGHT_LEGS, CROWN_LEGS, GOLDEN_LEGS = 2468, 2648, 2478, 2647, 2477, 2488, 2470
local BRASS_SHIELD, PLATE_SHIELD, COPPER_SHIELD, STEEL_SHIELD, BATTLE_SHIELD, GUARDIAN_SHIELD, DRAGON_SHIELD, CROWN_SHIELD, DEMON_SHIELD, MASTERMIND_SHIELD = 2511, 2510, 2530, 2509, 2513, 2515, 2516, 2519, 2520, 2514
local LEATHER_BOOTS, CROCODILE_BOOTS, PIRATE_BOOTS, FUR_BOOTS, BOOTS_OF_HASTE, STEEL_BOOTS = 2643, 3982, 5462, 7457, 2195, 2645

local config = {
	[9808] = { -- common rusty armor
		{{1, 30000}},
		{{30001, 60000}, CHAIN_ARMOR},
		{{60001, 90000}, SCALE_ARMOR}, 
		{{90001, 97000}, BRASS_ARMOR}, 
		{{97001, 99000}, PLATE_ARMOR}, 
		{{99001, 100000}, KNIGHT_ARMOR}
	},
	[9809] = { -- semi-rare rusty armor
		{{1, 40000}},
		{{40001, 57500}, CHAIN_ARMOR},
		{{57501, 70000}, SCALE_ARMOR}, 
		{{70001, 81000}, BRASS_ARMOR}, 
		{{81001, 90000}, PLATE_ARMOR}, 
		{{90001, 96500}, KNIGHT_ARMOR},
		{{96501, 99500}, PALADIN_ARMOR},
		{{99501, 100000}, CROWN_ARMOR}
	},
	[9810] = { -- rare rusty armor
		{{1, 50000}}, 
		{{50001, 60000}, CHAIN_ARMOR},
		{{60001, 70000}, SCALE_ARMOR}, 
		{{70001, 80000}, BRASS_ARMOR}, 
		{{80001, 87500}, PLATE_ARMOR}, 
		{{87501, 93000}, KNIGHT_ARMOR},
		{{93001, 96000}, PALADIN_ARMOR},
		{{96000, 97000}, CROWN_ARMOR},
		{{96001, 98500}, GOLDEN_ARMOR},
		{{98501, 99500}, DRAGON_SCALE_MAIL},
		{{99501, 100000}, MAGIC_PLATE_ARMOR}
	},
	[9811] = { -- common rusty legs
		{{1, 30000}},
		{{30001, 60000}, STUDDED_LEGS},
		{{60001, 85000}, CHAIN_LEGS},
		{{85001, 98000}, BRASS_LEGS},
		{{98001, 99500}, PLATE_LEGS},
		{{99501, 100000}, KNIGHT_LEGS}
	},
	[9812] = { -- semi-rare rusty legs
		{{1, 40000}},
		{{40001, 60000}, STUDDED_LEGS},
		{{60001, 75000}, CHAIN_LEGS},
		{{75001, 87500}, BRASS_LEGS},
		{{87501, 95500}, PLATE_LEGS},
		{{95501, 98250}, KNIGHT_LEGS},
		{{98251, 99250}, CROWN_LEGS},
		{{99251, 100000}, GOLDEN_LEGS}
	},
	[9813] = { -- rare rusty legs
		{{1, 50000}},
		{{50001, 75000}, BRASS_LEGS},
		{{75001, 90000}, PLATE_LEGS},
		{{90001, 97500}, KNIGHT_LEGS},
		{{97501, 99000}, CROWN_LEGS},
		{{99001, 100000}, GOLDEN_LEGS}
	},
	[9814] = { -- common rusty shield
		{{1, 30000}},
		{{30001, 50000}, BRASS_SHIELD},
		{{50001, 80000}, PLATE_SHIELD},
		{{80001, 87000}, COPPER_SHIELD},
		{{87001, 98000}, STEEL_SHEILD},
		{{98001, 99000}, BATTLE_SHIELD},
		{{99001, 100000}, GUARDIAN_SHIELD}
	},
	[9815] = { -- semi-rare rusty shield
		{{1, 40000}},
		{{40001, 57500}, BRASS_SHEILD},
		{{57501, 60000}, PLATE_SHEILD},
		{{60001, 71000}, COPPER_SHEILD},
		{{71001, 80000}, STEEL_SHIELD},
		{{80001, 86500}, BATTLE_SHIELD},
		{{86501, 89500}, GUARDIAN_SHIELD},
		{{89501, 95000}, DRAGON_SHIELD}
		{{95001, 100000}, CROWN_SHIELD}
	},
	[9816] = { -- rare rusty shield
		{{1, 50000}}, 
		{{50001, 60000}, BRASS_SHIELD},
		{{60001, 70000}, PLATE_SHIELD}, 
		{{70001, 80000}, COPPER_SHIELD}, 
		{{80001, 87500}, STEEL_SHIELD}, 
		{{87501, 93000}, BATTLE_SHIELD},
		{{93001, 96000}, GUARDIAN_SHIELD},
		{{96000, 97000}, DRAGON_SHIELD},
		{{96001, 98500}, CROWN_SHIELD},
		{{98501, 99500}, DEMON_SHIELD},
		{{99501, 100000}, MASTERMIND_SHIELD}
	}
	[9817] = { -- common rusty boots
	},
	[9818] = { -- semi-rare rusty boots
	},
	[9819] = { -- rare rusty boots
	},
	[9820] = { -- common rusty helmet
	},
	[9821] = { -- semi-rare rusty helmet
	},
	[9822] = { -- rare rusty helmet
	}
}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	local targetItem = config[itemEx.itemid]
	if targetItem then
		local chance = math.random(100000)
		for i = 1, #config do
			if chance >= targetItem[i][1][1] and chance <= targetItem[i][1][2] then
				if targetItem[i][2] then
					Item(itemEx.uid):transform(targetItem[i][2])
					toPosition:sendMagicEffect(CONST_ME_MAGIC_GREEN)
				else
					Player(cid):say((isInArray({9808, 9809, 9810}, itemEx.itemid) and "The armor was already damaged so badly that it broke when you tried to clean it." or "The legs were already damaged so badly that they broke when you tried to clean them."),TALKTYPE_MONSTER_SAY)
					Item(itemEx.uid):remove()
					toPosition:sendMagicEffect(CONST_ME_BLOCKHIT)
				end
				return Item(item.uid):remove(1)
			end
		end
	end
end
