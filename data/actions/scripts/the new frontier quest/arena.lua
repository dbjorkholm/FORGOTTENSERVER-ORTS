local config = {
	bosses = {
		{'Baron Brute', 'The Axeorcist'},
		{'Menace', 'Fatality'},
		{'Incineron', 'Coldheart'},
		{'Dreadwing', 'Doomhowl'},
		{'Haunter', 'The Dreadorian'},
		{'Rocko', 'Tremorak'},
		{'Tirecz'}
	},

	teleportPositions = {
		Position(33059, 31032, 3),
		Position(33057, 31034, 3)
	},

	positions = {
		-- other bosses
		Position(33065, 31035, 3),
		Position(33068, 31034, 3),

		-- first 2 bosses
		Position(33065, 31033, 3),
		Position(33066, 31037, 3)
	}
}

local function summonBoss(name, position)
	Game.createMonster(name, position)
	position:sendMagicEffect(CONST_ME_TELEPORT)
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player1 = Tile(Position({x = 33080, y = 31014, z = 2})):getTopCreature()
	if not(player1 and player1:isPlayer()) then
		return true
	end

	local player2 = Tile(Position({x = 33081, y = 31014, z = 2})):getTopCreature()
	if not(player2 and player2:isPlayer()) then
		return true
	end

	if player1:getStorageValue(Storage.TheNewFrontier.Questline) ~= 25 then
		player1:sendTextMessage(MESSAGE_STATUS_SMALL, 'You already finished this battle.')
		return true
	end

	if Game.getStorageValue(Storage.TheNewFrontier.Mission09) == 1 then
		player1:sendTextMessage(MESSAGE_STATUS_SMALL, 'The arena is already in use.')
		return true
	end

	Game.setStorageValue(Storage.TheNewFrontier.Mission09, 1)
	addEvent(clearArena, 30 * 60 * 1000, {x = 33053, y = 31024, z = 3}, {x = 33074, y = 31044, z = 3})
	player1:teleportTo(config.teleportPositions[1])
	player1:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player2:teleportTo(config.teleportPositions[2])
	player2:getPosition():sendMagicEffect(CONST_ME_TELEPORT)

	for i = 1, #config.bosses do
		for j = 1, #config.bosses[i] do
			addEvent(summonBoss, (i - 1) * 90 * 1000, config.bosses[i][j], config.positions[j + (i == 1 and 2 or 0)])
		end
	end
	return true
end