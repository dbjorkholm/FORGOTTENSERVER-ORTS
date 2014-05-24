local pos = {
	[2050] = {text = "You flipped the first level. Hurry up and find the next one!", number = 1},
	[2051] = {text = "You flipped the second level. Hurry up and find the next one!", number = 2},
	[2052] = {text = "You flipped the third level. Hurry up and find the next one!", number = 3},
	[2053] = {text = "You flipped the fourth level. Hurry up and find the next one!", number = 4},
	[2054] = {text = "You flipped the fifth level. Hurry up and find the next one!", number = 5},
	[2055] = {text = "You flipped the sixth level. Hurry up and find the next one!", number = 6},
	[2056] = {text = "You flipped the seventh level. Hurry up and find the next one!", number = 7},
	[2057] = {text = "You flipped the eighth level. Hurry up and find the next one!", number = 8},
	[2058] = {text = "You flipped the ninth level. Hurry up and find the next one!", number = 9},
	[2059] = {text = "You flipped the tenth level. Hurry up and find the next one!", number = 10},
	[2060] = {text = "You flipped the eleventh level. Hurry up and find the next one!", number = 11},
	[2061] = {text = "You flipped the twelfth level. Hurry up and find the next one!", number = 12},
	[2062] = {text = "You flipped the thirteenth level. Hurry up and find the next one!", number = 13},
	[2063] = {text = "You flipped the fourteenth level. Hurry up and find the next one!", number = 14},
	[2064] = {text = "You flipped the fifteenth level. Hurry up and find the next one!", number = 15}
}
 
local stones = {
	{x = 32851, y = 32333, z = 12},
	{x = 32852, y = 32333, z = 12}
}

function wallback1(cid, item, frompos, item2, topos)
local gatepos = {x=32833, y=32333, z=11, stackpos=1}
local itemuid = 2025
local itemitemid = 1946
doCreateItem(6289,1,gatepos)
doTransformItem(itemuid,itemitemid-1)
end

function wallback2(cid, item, frompos, item2, topos)
local gatepos = {x=32831, y=32333, z=11, stackpos=1}
local itemuid = 2026
local itemitemid = 1946
doCreateItem(6289,1,gatepos)
doTransformItem(itemuid,itemitemid-1)
end

function wallback3(cid, item, frompos, item2, topos)
local gatepos = {x=32837, y=32333, z=11, stackpos=1}
local itemuid = 2027
local itemitemid = 1946
doCreateItem(6289,1,gatepos)
doTransformItem(itemuid,itemitemid-1)
end

function wallback4(cid, item, frompos, item2, topos)
local gatepos = {x=32835, y=32333, z=11, stackpos=1}
local itemuid = 2028
local itemitemid = 1946
doCreateItem(6289,1,gatepos)
doTransformItem(itemuid,itemitemid-1)
end

function stonesback(cid, item, frompos, item2, topos)
local gatepos = {x=32851, y=32333, z=12, stackpos=1}
local gatepos1 = {x=32852, y=32333, z=12, stackpos=1}
local itemuid16 = 2065
local itemuid15 = 2064
local itemuid14 = 2063
local itemuid13 = 2062
local itemuid12 = 2061
local itemuid11 = 2060
local itemuid10 = 2059
local itemuid9 = 2058
local itemuid8 = 2057
local itemuid7 = 2056
local itemuid6 = 2055
local itemuid5 = 2054
local itemuid4 = 2053
local itemuid3 = 2052
local itemuid2 = 2051
local itemuid1 = 2050
local itemitemid = 1946
doCreateItem(1304,1,gatepos)
doCreateItem(1304,1,gatepos1)
doTransformItem(itemuid16,itemitemid-1)
doTransformItem(itemuid1,itemitemid-1)
doTransformItem(itemuid2,itemitemid-1)
doTransformItem(itemuid3,itemitemid-1)
doTransformItem(itemuid4,itemitemid-1)
doTransformItem(itemuid5,itemitemid-1)
doTransformItem(itemuid6,itemitemid-1)
doTransformItem(itemuid7,itemitemid-1)
doTransformItem(itemuid8,itemitemid-1)
doTransformItem(itemuid9,itemitemid-1)
doTransformItem(itemuid10,itemitemid-1)
doTransformItem(itemuid11,itemitemid-1)
doTransformItem(itemuid12,itemitemid-1)
doTransformItem(itemuid13,itemitemid-1)
doTransformItem(itemuid14,itemitemid-1)
doTransformItem(itemuid15,itemitemid-1)
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 2065) then
		if(item.itemid == 1945) then
			if(getGlobalStorageValue(1000) == 15) then
				for i = 1, 2 do
					doRemoveItem(getTileItemById(stones[i], 1304).uid, 1)
					doSendMagicEffect(stones[i], CONST_ME_EXPLOSIONHIT)
				end
				doTransformItem(item.uid, 1946)
				addEvent(wallback1, 1 * 1000)
				addEvent(wallback2, 1 * 1000)
				addEvent(wallback3, 1 * 1000)
				addEvent(wallback4, 1 * 1000)
				addEvent(stonesback, 900 * 1000)
				setGlobalStorageValue(1000, 0)
			else
				doCreatureSay(cid, "The final lever won't budge... yet.", TALKTYPE_ORANGE_1)
			end
			return true
		end
	end
	if(getGlobalStorageValue(1000) < 0) then
		setGlobalStorageValue(1000, 0)
	end
	if(item.itemid == 1945) then
		if((getGlobalStorageValue(1000) + 1) == pos[item.uid].number) then
			setGlobalStorageValue(1000, pos[item.uid].number)
			doCreatureSay(cid, pos[item.uid].text, TALKTYPE_ORANGE_1)
			doTransformItem(item.uid, 1946)
		else
			doCreatureSay(cid, "The final lever won't budge... yet.", TALKTYPE_ORANGE_1)
		end
	end
	return true
end
