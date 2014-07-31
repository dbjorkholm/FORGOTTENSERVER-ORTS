local config = {
	positions = {
		Position({x = 33258, y = 31080, z = 8}),
		Position({x = 33266, y = 31084, z = 8}),
		Position({x = 33259, y = 31089, z = 8}),
		Position({x = 33263, y = 31093, z = 8})
	},
	stairPosition = Position(33265, 31116, 8)
}

function doClearMissionArea()
	Game.setStorageValue(Storage.ChildrenoftheRevolution.Mission05, -1)
	local spectators = Game.getSpectators(Position({x = 33268, y = 31119, z = 7}), false, true, 26, 26, 20, 20)
	for _, spectator in ipairs(spectators) do
		spectator:teleportTo({x = 33353, y = 31410, z = 8})
		spectator:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		if spectator:getStorageValue(Storage.ChildrenoftheRevolution.Questline) == 19 then
			spectator:setStorageValue(Storage.ChildrenoftheRevolution.Questline, 20)
		end
	end

	local monsters = Game.getSpectators(Position({x = 33268, y = 31119, z = 7}), false, false, 26, 26, 20, 20)
	for _, monster in ipairs(monsters) do
		monster:remove()
	end
	return true
end

local function removeStairs()
	Tile(config.stairPosition):getItemById(3687):transform(3653)
end

local function summonWave(i)
	local summonPosition = Position(math.random(33252, 33288), math.random(31105, 31134), 7)
	Game.createMonster(i < 3 and 'eternal guardian' or 'lizard chosen', summonPosition)
	summonPosition:sendMagicEffect(CONST_ME_TELEPORT)
end

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	if player:getStorageValue(Storage.ChildrenoftheRevolution.Questline) ~= 19
			or Game.getStorageValue(Storage.ChildrenoftheRevolution.Mission05) == 1 then
		return true
	end

	local players = {}
	for i = 1, #config.positions do
		local creature = Tile(config.positions[i]):getTopCreature()
		if creature and creature:isPlayer() then
			table.insert(players, creature)
		end
	end

	if #players == #config.positions then
		for i = 1, #players do
			players[i]:say("A clicking sound tatters the silence.", TALKTYPE_MONSTER_SAY)
		end

		Tile(config.stairPosition):getItemById(3653):transform(3687)
		addEvent(removeStairs, 30 * 1000)

		Game.setStorageValue(Storage.ChildrenoftheRevolution.Mission05, 1)
		for wave = 1, 4 do
			for i = 1, 20 do
				addEvent(summonWave, wave * 30 * 1000, wave)
			end
		end
		addEvent(doClearMissionArea, 5 * 30 * 1000)
	end
	return true
end
