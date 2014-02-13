local mobs = {
	-- Vampires
	[1] = {x = 32962, y = 32412, z = 12, mob="Arachir The Ancient One"},
	[2] = {x = 32009, y = 32795, z = 10, mob="Diblis The Fair"},
	[3] = {x = 33266, y = 31767, z = 10, mob="Sir Valorcrest"},
	[4] = {x = 32788, y = 31673, z = 14, mob="Zevelon Duskbringer"},
	
	-- Bosses
	[5] = {x = 33234, y = 32278, z = 12, mob="Demodras"},
	[6] = {x = 33101, y = 32138, z = 8, mob="Dharalion"},
	[7] = {x = 32855, y = 32333, z = 6, mob="Fernfang"},
	[8] = {x = 32121, y = 31134, z = 7, mob="Man in the Cave"},
	[9] = {x = 31948, y = 32572, z = 10, mob="Necropharus"},
	[10] = {x = 32466, y = 31965, z = 8, mob="The Horned Fox"},
	[11] = {x = 32023, y = 31580, z = 7, mob="Yeti"},
		
	-- Mounts
	[12] = {x = 32109, y = 32783, z = 12, mob="Crustacea Gigantica"},
	[13] = {x = 33188, y = 31241, z = 7, mob="Draptor"},
	[14] = {x = 32837, y = 32700, z = 7, mob="Midnight Panther"},
	[15] = {x = 31914, y = 32559, z = 10, mob="Undead Cavebear"},
		
	-- PoI bosses
	[16] = {x = 32801, y = 32351, z = 15, mob="Countess Sorrow"},
	[17] = {x = 32875, y = 32231, z = 15, mob="Dracola"},
	[18] = {x = 32874, y = 32278, z = 15, mob="Massacre"},
	[19] = {x = 32771, y = 32248, z = 15, mob="Mr. Punish"},
	[20] = {x = 32785, y = 32290, z = 15, mob="The Handmaiden"},
	[21] = {x = 32845, y = 32344, z = 15, mob="The Plasmother"}
}
 
function onThink(interval, lastExecution, thinkInterval)
	spawn = mobs[math.random(21)]
	if(math.random(1000) <= 50) then
		doSummonCreature(spawn.mob, {x=spawn.x, y=spawn.y, z=spawn.z})
	end
return true
end
