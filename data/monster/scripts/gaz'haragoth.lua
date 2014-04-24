Running = {}

local DoomArea = createCombatArea{
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}
}

local function DOOM(cid)
	if(cid ~= nil) then
		if getCreatureTarget(cid) ~= 0 then
			doSendDistanceShoot(getCreaturePosition(cid), getCreaturePosition(getCreatureTarget(cid)), 47)
			doAreaCombatHealth(cid, 16, getCreaturePosition(getCreatureTarget(cid)), DoomArea, -30000, -30000, 47)
		end
	end
end


local function Uheal(cid)
	Running[cid] = false
	doCreatureAddHealth(cid, 300000)
end

function onCreatureSay(self, cid, talktype, text)
	if(Creature(cid):isMonster()) then
		if(Creature(cid):getId() ~= nil) then
			local DoomText ="Gaz'haragoth begins to channel DEATH AND DOOM into the area! RUN!"
			if (text == DoomText and talktype == 36) then
					addEvent(DOOM, 4000, cid)
				
			end
		end
	end
end

function onThink(cid)
	local minimo = (getCreatureHealth(cid)/getCreatureMaxHealth(cid))*100
	if (minimo < 12.5 and Running[Creature(cid):getId()] ~= true) then
		Running[Creature(cid):getId()] = true
		addEvent(Uheal, 1000 * 7, Creature(cid):getId())
	end
end

function onCreatureAppear(cid)
	Running[Creature(cid):getId()] = false
end
