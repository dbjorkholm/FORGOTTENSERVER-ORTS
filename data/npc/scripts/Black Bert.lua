local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local buyList = 
{
	{itemId = 10942, price = 600}, -- Almanac of Magic
	{itemId = 10154, price = 10000}, -- Animal Fetish
	{itemId = 10943, price = 600}, -- Baby Rotworm
	{itemId = 7500, price = 6000}, -- Bale of White Cloth
	{itemId = 2329, price = 8000}, -- Bill
	{itemId = 9369, price = 50000}, -- Blood Crystal
	{itemId = 10159, price = 10000}, -- Bloodkiss Flower
	{itemId = 10109, price = 5000}, -- Bundle of Rags
	{itemId = 10615, price = 1000}, -- Carrying Device
	{itemId = 7499, price = 2000}, -- Cigar
	{itemId = 2347, price = 150}, -- Cookbook
	{itemId = 14338, price = 40000}, -- Damaged Logbook
	{itemId = 14352, price = 17000}, -- Dark Essence
	{itemId = 10158, price = 13000}, -- Deep Crystal
	{itemId = 10169, price = 8000}, -- Elemental Crystal
	{itemId = 11397, price = 600}, -- Empty Beer Bottle
	{itemId = 8111, price = 100}, -- Exploding Cookie
	{itemId = 12501, price = 4000}, -- Exquisite Silk
	{itemId = 12503, price = 4000}, -- Exquisite Wood
	{itemId = 12500, price = 600}, -- Faded Last Will
	{itemId = 4845, price = 1000}, -- Family Brooch
	{itemId = 10308, price = 10000}, -- Fan Club Membership Card
	{itemId = 10616, price = 1000}, -- Filled Carrying Device
	{itemId = 8766, price = 7000}, -- Fishnapped Goldfish
	{itemId = 10926, price = 700}, -- Flask of Crown Polisher
	{itemId = 11106, price = 1000}, -- Flask of Extra Greasy Oil
	{itemId = 10760, price = 1000}, -- Flask of Poison
	{itemId = 12506, price = 4000}, -- Flexible Dragon Scale
	{itemId = 14351, price = 5000}, -- Formula for a Memory Potion
	{itemId = 4858, price = 6000}, -- Funeral Urn
	{itemId = 9662, price = 50000}, -- Ghost's Tear
	{itemId = 4843, price = 24000}, -- Giant Ape's Hair
	{itemId = 10165, price = 13500}, -- Golem Blueprint
	{itemId = 10173, price = 25000}, -- Golem Head
	{itemId = 10454, price = 350}, -- Headache Pill
	{itemId = 2330, price = 8000}, -- Letterbag
	{itemId = 12285, price = 1000}, -- Lump of Clay
	{itemId = 10307, price = 8500}, -- Machine Crate
	{itemId = 12508, price = 4000}, -- Magic Crystal
	{itemId = 10167, price = 13000}, -- Mago Mechanic Core
	{itemId = 10928, price = 650}, -- Map to the Unknown
	{itemId = 7281, price = 500}, -- Memory Crystal
	{itemId = 4852, price = 3000}, -- Memory Stone
	{itemId = 12507, price = 4000}, -- Mystic Root
	{itemId = 10225, price = 5250}, -- Nautical Map
	{itemId = 12505, price = 4000}, -- Old Iron
	{itemId = 10170, price = 13000}, -- Old Power Core
	{itemId = 10613, price = 1000}, -- Plans for a Strange Device
	{itemId = 11104, price = 1000}, -- Rare Crystal
	{itemId = 12297, price = 1000}, -- Sacred Earth
	{itemId = 10155, price = 12500}, -- Shadow Orb
	{itemId = 4854, price = 500}, -- Sheet of Tracing Paper
	{itemId = 7697, price = 15000}, -- Signet Ring
	{itemId = 4846, price = 8000}, -- Snake Destroyer
	{itemId = 10945, price = 666}, -- Soul Contract
	{itemId = 14323, price = 5000}, -- Special Flask
	{itemId = 12502, price = 4000}, -- Spectral Cloth
	{itemId = 4847, price = 15000}, -- Spectral Dress
	{itemId = 10166, price = 12500}, -- Stabilizer
	{itemId = 15389, price = 5000}, -- Strange Powder
	{itemId = 12504, price = 4000}, -- Strong Sinew
	{itemId = 2346, price = 16000}, -- Tear of Daraman
	{itemId = 7699, price = 5000}, -- Technomancer Beard
	{itemId = 9733, price = 8000}, -- The Alchemists' Formulas
	{itemId = 8752, price = 10000}, -- The Ring of the Count
	{itemId = 7487, price = 16000}, -- Toy Mouse
	{itemId = 10944, price = 550}, -- Universal Tool
	{itemId = 12295, price = 1000}, -- Unworked Sacred Wood
	{itemId = 4838, price = 18000}, -- Whisper Moss
	{itemId = 10157, price = 12500}, -- Worm Queen Tooth
	{itemId = 14336, price = 4000}, -- Wrinkled Parchment
}

local function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())