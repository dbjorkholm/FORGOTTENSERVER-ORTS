local spawns = {
	-- Vampires
	[1]  = {x = 32962, y = 32412, z = 12, monster = 'Arachir The Ancient One'},
	[2]  = {x = 32009, y = 32795, z = 10, monster = 'Diblis The Fair'},
	[3]  = {x = 33266, y = 31767, z = 10, monster = 'Sir Valorcrest'},
	[4]  = {x = 32788, y = 31673, z = 14, monster = 'Zevelon Duskbringer'},

	-- Bosses
	[5]  = {x = 33234, y = 32278, z = 12, monster = 'Demodras'},
	[6]  = {x = 33101, y = 32138, z = 8, monster = 'Dharalion'},
	[7]  = {x = 32855, y = 32333, z = 6, monster = 'Fernfang'},
	[8]  = {x = 32121, y = 31134, z = 7, monster = 'Man in the Cave'},
	[9]  = {x = 31948, y = 32572, z = 10, monster = 'Necropharus'},
	[10] = {x = 32466, y = 31965, z = 8, monster = 'The Horned Fox'},
	[11] = {x = 32023, y = 31580, z = 7, monster = 'Yeti'},

	-- Mounts
	[12] = {x = 32109, y = 32783, z = 12, monster = 'Crustacea Gigantica'},
	[13] = {x = 33188, y = 31241, z = 7, monster = 'Draptor'},
	[14] = {x = 32837, y = 32700, z = 7, monster = 'Midnight Panther'},
	[15] = {x = 31914, y = 32559, z = 10, monster = 'Undead Cavebear'},

	-- PoI bosses
	[16] = {x = 32794, y = 32372, z = 15, monster = 'Countess Sorrow'},
	[17] = {x = 32840, y = 32310, z = 15, monster = 'Dracola'},
	[18] = {x = 32869, y = 32267, z = 15, monster = 'Massacre'},
	[19] = {x = 32759, y = 32243, z = 15, monster = 'Mr. Punish'},
	[20] = {x = 32785, y = 32276, z = 15, monster = 'The Handmaiden'},
	[21] = {x = 32845, y = 32325, z = 15, monster = 'The Plasmother'},
	[22] = {x = 32913, y = 32212, z = 15, monster = 'The Imperor'}
}

function onThink(interval, lastExecution, thinkInterval)
	if math.random(1000) > 50 then
		return true
	end

	local spawn = spawns[math.random(#spawns)]
	Game.createMonster(spawn.monster, {x = spawn.x, y = spawn.y, z = spawn.z})
	return true
end
