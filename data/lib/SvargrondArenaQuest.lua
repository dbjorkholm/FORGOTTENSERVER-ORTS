timePerPit = 600 --600 seconds = 10 minutes
 
-- These variables need to be equal to the reward-doors' action id --[[
ACTION_GREENHORNDOOR = 26100 
ACTION_SCRAPPERDOOR = 27100
ACTION_WARLORDDOOR = 28100
--]]
 
ITEM_FIREFIELD_TIMER = {10288,10288,10288}
ITEM_STONEPILLAR = 1354
ITEM_TELEPORT = 5023
ITEM_NOTERASABLE = {10288, 1354, 1543, 1544, 1545} --Not erasable items when pit is reseted
 
STORAGE_ARENA = 1100
STORAGE_PIT = 1101
 
POSITION_REWARD = {x = 32222, y = 31080, z = 6}
POSITION_KICK = {x = 32251, y = 31098, z = 6}
 
--Just paste here the positions of the first pit and script will configure positions for other pits.
FIRST_PIT =
{
	fromPos = {x = 32205, y = 31094, z = 7}, 
	toPos = {x = 32214, y = 31103, z = 7},
	center = {x = 32210, y = 31098, z = 7},
	pillar = {x = 32204, y = 31098, z = 7},
	tp = {x = 32204, y = 31098, z = 7},
	summon = {x = 32210, y = 31100, z = 7}
}
 
PITS =
{
	[1] =
	{
		fromPos = FIRST_PIT.fromPos,
		toPos = FIRST_PIT.toPos,
		center = FIRST_PIT.center,
		pillar = FIRST_PIT.pillar,
		tp = FIRST_PIT.tp,
		summon = FIRST_PIT.summon
	},
	[2] =
	{
		fromPos = {x = FIRST_PIT.fromPos.x - 14, y = FIRST_PIT.fromPos.y, z = FIRST_PIT.fromPos.z},
		toPos = {x = FIRST_PIT.toPos.x - 14, y = FIRST_PIT.toPos.y, z = FIRST_PIT.toPos.z},
		center = {x = FIRST_PIT.center.x - 14, y = FIRST_PIT.center.y, z = FIRST_PIT.center.z},
		pillar = {x = FIRST_PIT.pillar.x - 14, y = FIRST_PIT.pillar.y, z = FIRST_PIT.pillar.z},
		tp = {x = FIRST_PIT.tp.x - 14, y = FIRST_PIT.tp.y, z = FIRST_PIT.tp.z},
		summon = {x = FIRST_PIT.summon.x - 14, y = FIRST_PIT.summon.y, z = FIRST_PIT.summon.z}
	},
	[3] =
	{
		fromPos = {x = FIRST_PIT.fromPos.x - 28, y = FIRST_PIT.fromPos.y, z = FIRST_PIT.fromPos.z},
		toPos = {x = FIRST_PIT.toPos.x - 28, y = FIRST_PIT.toPos.y, z = FIRST_PIT.toPos.z},
		center = {x = FIRST_PIT.center.x - 28, y = FIRST_PIT.center.y, z = FIRST_PIT.center.z},
		pillar = {x = FIRST_PIT.pillar.x - 28, y = FIRST_PIT.pillar.y, z = FIRST_PIT.pillar.z},
		tp = {x = FIRST_PIT.tp.x - 28, y = FIRST_PIT.tp.y, z = FIRST_PIT.tp.z},
		summon = {x = FIRST_PIT.summon.x - 28, y = FIRST_PIT.summon.y, z = FIRST_PIT.summon.z}
	},
	[4] =
	{
		fromPos = {x = FIRST_PIT.fromPos.x - 42, y = FIRST_PIT.fromPos.y, z = FIRST_PIT.fromPos.z},
		toPos = {x = FIRST_PIT.toPos.x - 42, y = FIRST_PIT.toPos.y, z = FIRST_PIT.toPos.z},
		center = {x = FIRST_PIT.center.x - 42, y = FIRST_PIT.center.y, z = FIRST_PIT.center.z},
		pillar = {x = FIRST_PIT.pillar.x - 42, y = FIRST_PIT.pillar.y, z = FIRST_PIT.pillar.z},
		tp = {x = FIRST_PIT.tp.x - 42, y = FIRST_PIT.tp.y, z = FIRST_PIT.tp.z},
		summon = {x = FIRST_PIT.summon.x - 42, y = FIRST_PIT.summon.y, z = FIRST_PIT.summon.z}
	},
	[5] =
	{
		fromPos = {x = FIRST_PIT.fromPos.x - 35, y = FIRST_PIT.fromPos.y - 14, z = FIRST_PIT.fromPos.z},
		toPos = {x = FIRST_PIT.toPos.x - 35, y = FIRST_PIT.toPos.y - 14, z = FIRST_PIT.toPos.z},
		center = {x = FIRST_PIT.center.x - 35, y = FIRST_PIT.center.y - 14, z = FIRST_PIT.center.z},
		pillar = {x = FIRST_PIT.pillar.x - 35, y = FIRST_PIT.pillar.y - 14, z = FIRST_PIT.pillar.z},
		tp = {x = FIRST_PIT.tp.x - 35, y = FIRST_PIT.tp.y - 14, z = FIRST_PIT.tp.z},
		summon = {x = FIRST_PIT.summon.x - 35, y = FIRST_PIT.summon.y - 14, z = FIRST_PIT.summon.z}
	},
	[6] =
	{
		fromPos = {x = FIRST_PIT.fromPos.x - 21, y = FIRST_PIT.fromPos.y - 14, z = FIRST_PIT.fromPos.z},
		toPos = {x = FIRST_PIT.toPos.x - 21, y = FIRST_PIT.toPos.y - 14, z = FIRST_PIT.toPos.z},
		center = {x = FIRST_PIT.center.x - 21, y = FIRST_PIT.center.y - 14, z = FIRST_PIT.center.z},
		pillar = {x = FIRST_PIT.pillar.x - 21, y = FIRST_PIT.pillar.y - 14, z = FIRST_PIT.pillar.z},
		tp = {x = FIRST_PIT.tp.x - 21, y = FIRST_PIT.tp.y - 14, z = FIRST_PIT.tp.z},
		summon = {x = FIRST_PIT.summon.x - 21, y = FIRST_PIT.summon.y - 14, z = FIRST_PIT.summon.z}
	},
	[7] =
	{
		fromPos = {x = FIRST_PIT.fromPos.x - 7, y = FIRST_PIT.fromPos.y - 14, z = FIRST_PIT.fromPos.z},
		toPos = {x = FIRST_PIT.toPos.x - 7, y = FIRST_PIT.toPos.y - 14, z = FIRST_PIT.toPos.z},
		center = {x = FIRST_PIT.center.x - 7, y = FIRST_PIT.center.y - 14, z = FIRST_PIT.center.z},
		pillar = {x = FIRST_PIT.pillar.x - 7, y = FIRST_PIT.pillar.y - 14, z = FIRST_PIT.pillar.z},
		tp = {x = FIRST_PIT.tp.x - 7, y = FIRST_PIT.tp.y - 14, z = FIRST_PIT.tp.z},
		summon = {x = FIRST_PIT.summon.x - 7, y = FIRST_PIT.summon.y - 14, z = FIRST_PIT.summon.z}
	},
	[8] =
	{
		fromPos = {x = FIRST_PIT.fromPos.x - 14, y = FIRST_PIT.fromPos.y - 28, z = FIRST_PIT.fromPos.z},
		toPos = {x = FIRST_PIT.toPos.x - 14, y = FIRST_PIT.toPos.y - 28, z = FIRST_PIT.toPos.z},
		center = {x = FIRST_PIT.center.x - 14, y = FIRST_PIT.center.y - 28, z = FIRST_PIT.center.z},
		pillar = {x = FIRST_PIT.pillar.x - 14, y = FIRST_PIT.pillar.y - 28, z = FIRST_PIT.pillar.z},
		tp = {x = FIRST_PIT.tp.x - 14, y = FIRST_PIT.tp.y - 28, z = FIRST_PIT.tp.z},
		summon = {x = FIRST_PIT.summon.x - 14, y = FIRST_PIT.summon.y - 28, z = FIRST_PIT.summon.z}
	},
	[9] =
	{
		fromPos = {x = FIRST_PIT.fromPos.x - 28, y = FIRST_PIT.fromPos.y - 28, z = FIRST_PIT.fromPos.z},
		toPos = {x = FIRST_PIT.toPos.x - 28, y = FIRST_PIT.toPos.y - 28, z = FIRST_PIT.toPos.z},
		center = {x = FIRST_PIT.center.x - 28, y = FIRST_PIT.center.y - 28, z = FIRST_PIT.center.z},
		pillar = {x = FIRST_PIT.pillar.x - 28, y = FIRST_PIT.pillar.y - 28, z = FIRST_PIT.pillar.z},
		tp = {x = FIRST_PIT.tp.x - 28, y = FIRST_PIT.tp.y - 28, z = FIRST_PIT.tp.z},
		summon = {x = FIRST_PIT.summon.x - 28, y = FIRST_PIT.summon.y - 28, z = FIRST_PIT.summon.z}
	},
	[10] =
	{
		fromPos = {x = FIRST_PIT.fromPos.x - 21, y = FIRST_PIT.fromPos.y - 42, z = FIRST_PIT.fromPos.z},
		toPos = {x = FIRST_PIT.toPos.x - 21, y = FIRST_PIT.toPos.y - 42, z = FIRST_PIT.toPos.z},
		center = {x = FIRST_PIT.center.x - 21, y = FIRST_PIT.center.y - 41, z = FIRST_PIT.center.z},
		pillar = {x = FIRST_PIT.pillar.x - 21, y = FIRST_PIT.pillar.y - 41, z = FIRST_PIT.pillar.z},
		tp = {x = FIRST_PIT.tp.x - 21, y = FIRST_PIT.tp.y - 41, z = FIRST_PIT.tp.z},
		summon = {x = FIRST_PIT.summon.x - 21, y = FIRST_PIT.summon.y - 41, z = FIRST_PIT.summon.z}
	}
}
 
ARENA =
{
	[1] =
	{
		name = "Greenhorn",
		price = 1000,
		creatures =
		{
			[1] = "frostfur",
			[2] = "bloodpaw",
			[3] = "bovinus",
			[4] = "achad",
			[5] = "colerian the barbarian",
			[6] = "the hairy one",
			[7] = "axeitus headbanger",
			[8] = "rocky",
			[9] = "cursed gladiator",
			[10] = "orcus the cruel"
		},
		reward = 
		{
			storage = 1102,
			trophy = 5807,
			trophyStorage = 1103,
			desc = "A brave warrior that finished the Greenhorn mode. Awarded to %s",
			[26300] =
			{
				container = true,
				id = 1990,
				inside =
				{
					{2114, 1},
					{9570, 1},
					{6574, 1},
					{2688, 10},
					{7372, 1}
				}
			},
			[26400] =
			{
				container = true,
				id = 7342,
				inside =
				{
					{7364, 100},
					{7365, 100}
				},
			},
			[26500] = 
			{
				id = {7406, 1}
			},
			[26600] = 
			{
				id = {7380, 1}
			},
			[26700] = 
			{
				id = {7392, 1}
			}
		}
	},
	[2] =
	{
		name = "Scrapper",
		price = 5000,
		creatures =
		{
			[1] = "avalanche",
			[2] = "kreebosh the exile",
			[3] = "the dark dancer",
			[4] = "the hag",
			[5] = "slim",
			[6] = "grimgor guteater",
			[7] = "drasilla",
			[8] = "spirit of earth",
			[9] = "spirit of water",
			[10] = "spirit of fire"
		},
		reward = 
		{
			storage = 1104,
			trophy = 5806,
			trophyStorage = 1105,
			desc = "A brave warrior that finished the Scrapper mode. Awarded to %s",
			[27300] =
			{
				container = true,
				id = 1990,
				inside =
				{
					{7183, 1},
					{6574, 1},
					{7373, 1},
					{2688, 10}
				}
			},
			[27400] =
			{
				container = true,
				id = 7342,
				inside =
				{
					{2304, 50},
					{2311, 50},
					{2547, 200},
					{7365, 100}
				},
			},
			[27500] = 
			{
				id = {7384, 1}
			},
			[27600] = 
			{
				id = {7389, 1}
			},
			[27700] = 
			{
				id = {7415, 1}
			}
		}
	},
	[3] =
	{
		name = "Warlord",
		price = 10000,
		creatures =
		{
			[1] = "webster",
			[2] = "darakan the executioner",
			[3] = "norgle glacierbeard",
			[4] = "the pit lord",
			[5] = "svoren the mad",
			[6] = "the masked marauder",
			[7] = "gnorre chyllson",
			[8] = "fallen mooh'tah master ghar",
			[9] = "deathbringer",
			[10] = "the obliverator"
		},
		reward = 
		{
			storage = 1006,
			trophy = 5805,
			trophyStorage = 1007,
			desc = "A brave warrior that finished the Warlord mode. Awarded to %s",
			[28300] =
			{
				container = true,
				id = 1990,
				inside =
				{
					{6568, 1},
					{6574, 1},
					{7374, 1},
					{2688, 10}
				}
			},
			[28400] =
			{
				container = true,
				id = 7342,
				inside =
				{
					{6529, 100},
					{7440, 1},
					{7443, 1},
					{2268, 50},
					{2273, 50}
				},
			},
			[28500] = 
			{
				id = {7390, 1}
			},
			[28600] = 
			{
				id = {7434, 1}
			},
			[28700] = 
			{
				id = {7429, 1}
			}
		}
	}
}
 
 
function getTopItem(p)
	p.stackpos = 0
	local v = getThingfromPos(p)
	repeat
		p.stackpos = p.stackpos + 1
		v = getThingfromPos(p)
	until v.itemid == 0
	p.stackpos = p.stackpos - 1
return getThingfromPos(p)
end
 
function getCreaturesOnPit(pitid)
 
	local tmp = {}
	local pos
	local thing
	if(PITS[pitid]) then
		for x = PITS[pitid].fromPos.x, PITS[pitid].toPos.x do
			for y = PITS[pitid].fromPos.y, PITS[pitid].toPos.y do
				for z = PITS[pitid].fromPos.z, PITS[pitid].toPos.z do
					pos = {x = x, y = y, z = z}
					thing = getTopCreature(pos)
					if(isCreature(thing.uid)) then
						table.insert(tmp, thing.uid)
					end
				end
			end
		end
	end
return tmp
end
 
function resetPit(pitid)
	if(PITS[pitid]) then
		for x = PITS[pitid].fromPos.x, PITS[pitid].toPos.x do
			for y = PITS[pitid].fromPos.y, PITS[pitid].toPos.y do
				for z = PITS[pitid].fromPos.z, PITS[pitid].toPos.z do
					local position = {x = x, y = y, z = z}
					local thing = getTopItem(position)
					if(thing.itemid > 0 and not(isInArray(ITEM_NOTERASABLE, thing.itemid)) and not(isCreature(thing.uid)) and isMoveable(thing.uid)) then
						local ir = Item(thing.uid)
						ir:remove()
					end
					thing = getTopCreature(position)
					if(isMonster(thing.uid)) then
						local tu = Creature(thing.uid)
						tu:remove()
					end
				end
			end
		end
	end
return true
end
 
function startTimer(pitid)
	if(not(isInArray(ITEM_FIREFIELD_TIMER, getTopItem(PITS[pitid].fromPos).itemid))) then
		local id = Item(doCreateItem(ITEM_FIREFIELD_TIMER[1], 1, PITS[pitid].fromPos))
		id:decay()
		addEvent(decayTimer, timePerPit * 1000, pitid, PITS[pitid].fromPos)
	end
return true
end
 
function decayTimer(pitid)
	local field = getTopItem(PITS[pitid].fromPos)
	if(field.itemid == ITEM_FIREFIELD_TIMER[1]) then
		local fu = Item(field.uid)
		fu:remove()
	elseif(isInArray(ITEM_FIREFIELD_TIMER, field.itemid)) then
		addEvent(decayTimer, timePerPit * 1000, pitid, PITS[pitid].fromPos)
	end
return true
end
