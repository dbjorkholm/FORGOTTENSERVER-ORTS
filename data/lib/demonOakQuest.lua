HALLOWEDAXE_PRICE = 1000
 
TYPE_PLAYER = 1
TYPE_MONSTER = 2
TYPE_NPC = 3
TYPE_ALL = 4
 
GET_COUNT = 1
GET_UID = 2
 
oneInArea = true
killAllBeforeCut = true

waves = 10
positions = {
	kick = {x=32716, y=32340, z=7},
	summon = {
		{x = 32714, y = 32348, z = 7},
		{x = 32712, y = 32349, z = 7},
		{x = 32711, y = 32351, z = 7},
		{x = 32713, y = 32354, z = 7},
		{x = 32716, y = 32354, z = 7},
		{x = 32719, y = 32354, z = 7},
		{x = 32721, y = 32351, z = 7},
		{x = 32719, y = 32348, z = 7}
	},
	rewardRoom = {x = 32714, y = 32398, z = 8},
	demonOak = {x = 32716, y = 32352, z = 7}
}

summons_ = {
	[8288] = {
		[5] = {{monster = "braindeath", count = 3}, {monster = "bonebeast", count = 1}},
		[10] = {{monster = "betrayed wraith", count = 2}}
	},
	[8289] = {
		[5] = {{monster = "lich", count = 3}},
		[10] = {{monster = "dark torturer", count = 1}, {monster = "blightwalker", count = 1}}
	},
	[8290] = {
		[5] = {{monster = "banshee", count = 3}},
		[10] = {{monster = "grim reaper", count = 1}}
	},
	[8291] = {
		[5] = {{monster = "giant spider", count = 2}, {monster = "lich", count = 1}},
		[10] = {{monster = "undead dragon", count = 1}, {monster = "hand of cursed fate", count = 1}}
	}
}
 
questAreaPosition = {
	{x = 32706, y = 32345, z = 7, stackpos = 255},
	{x = 32725, y = 32357, z = 7, stackpos = 255}
}
 
demonOak = {8288, 8289, 8290, 8291}
 
storages = {
	done = 1010,
	treeCut = 1011
}
 
sounds = {
	[1] = {
		"Release me and you will be rewarded greatefully!",
		"What is this? Demon Legs lying here? Someone might have lost them!",
		"I'm trapped, come here and free me fast!!",
		"I can bring your beloved back from the dead, just release me!",
		"What a nice shiny golden armor. Come to me and you can have it!",
		"Find a way in here and release me! Pleeeease hurry!",
		"You can have my demon set, if you help me get out of here!"
	},
	[2] = {
		"MY ROOTS ARE SHARP AS A SCYTHE! FEEL IT?!?",
		"CURSE YOU!",
		"RISE, MINIONS, RISE FROM THE DEAD!!!!",
		"AHHHH! YOUR BLOOD MAKES ME STRONG!",
		"GET THE BONES, HELLHOUND! GET THEM!!",
		"GET THERE WHERE I CAN REACH YOU!!!",
		"ETERNAL PAIN AWAITS YOU! NICE REWARD, HUH?!?!",
		"YOU ARE GOING TO PAY FOR EACH HIT WITH DECADES OF TORTURE!!",
		"ARGG! TORTURE IT!! KILL IT SLOWLY MY MINION!!"
	}
}
 
function getCreaturesInQuestArea(type, fromPos, toPos, get, countSummon)
	local types = {
		[TYPE_PLAYER] = isPlayer,
		[TYPE_MONSTER] = isMonster,
		[TYPE_NPC] = isNpc,
		[TYPE_ALL] = isCreature
	}
 
	local tmp = {}
	local t = types[type]
	if(not(t)) then
		return print("[!] --> [Warning - Function::getCreaturesInQuestArea] Unknow type " .. (type or "(nil value)"))
	end
 
	local thing
	local pos
	for x = fromPos.x, toPos.x do
		for y = fromPos.y, toPos.y do
			for z = fromPos.z, toPos.z do
				pos = {x = x, y = y, z = z}
				thing = getTopCreature(pos)
				if(t(thing.uid)) then
					table.insert(tmp, thing.uid)
					if(not(countSummon and isSummon(thing.uid))) then
						for i = 1, #tmp do
							if(tmp[i] == thing.uid) then
								table.remove(tmp, i)
								break
							end
						end
					end
				end
			end
		end
	end
	return (get == GET_COUNT and #tmp or get == GET_UID and tmp or print("[Warning - Function::getCreaturesInQuestArea] Unknow type to get " .. (get or "(nil value)")))
end
 
function isLastCut(cid)
	local p = Player(cid)
	local k, s = 0, 0
	if(not(demonOak or type(demonOak) ~= "table")) then
		return false
	end
	for i = demonOak[1], demonOak[#demonOak] do
		if(p:getStorageValue(i) == #summons_ + 1) then
			k = k + 1
		end
		if(p:getStorageValue(i) == #summons_) then
			s = s + 1
		end
	end
	return (k == 3 and s == 1 and true or false)
end
