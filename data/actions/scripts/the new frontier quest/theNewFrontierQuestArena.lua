
local config = {
	boss = {
		"Baron Brute",
		"The Axeorcist",
		"Menace",
		"Fatality",
		"Incineron",
		"Coldheart",
		"Dreadwing",
		"Doomhowl",
		"Haunter",
		"The Dreadorian",
		"Rocko",
		"Tremorak"
	},
	pos = {
		Position({x = 33061, y = 31036, z = 3}),
		Position({x = 33064, y = 31036, z = 3})
	}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player1 = Tile(Position({x = 33080, y = 31014, z = 2})):getTopCreature() if player1 == nil or not player1:isPlayer() then return true end
	local player2 = Tile(Position({x = 33081, y = 31014, z = 2})):getTopCreature() if player2 == nil or not player2:isPlayer()  then return true end
	if item.uid == 3157 then
		if player1:getStorageValue(Storage.TheNewFrontier.Questline) == 25 then
			if not Game.getStorageValue(Storage.TheNewFrontier.Mission09) ~= -1 then
				Game.setStorageValue(Storage.TheNewFrontier.Mission09, 1)
				addEvent(clearArena, 30 * 60 * 1000, {x = 33053, y = 31024, z = 3}, {x = 33074, y = 31044, z = 3})
				player1:teleportTo(config["pos"][1])
				player1:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				player2:teleportTo(config["pos"][2])
				player2:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				Game.createMonster(config["boss"][1], {x = 33064, y = 31032, z = 3})--first 2 bosses
				Game.createMonster(config["boss"][2], {x = 33067, y = 31038, z = 3})
				for i = 2, 12, 2 do
					for k = 1, 2 do
						addEvent(function() Game.createMonster(config["boss"][i + k], config["pos"][k]) Position(config["pos"][k]):sendMagicEffect(CONST_ME_TELEPORT) end, i * 45 * 1000, cid) -- 90 sec
					end
				end
				addEvent(function() Game.createMonster("Tirecz", config["pos"][1]) Position(config["pos"][1]):sendMagicEffect(CONST_ME_TELEPORT) end, 6 * 90 * 1000, cid) -- 90 sec
			else
				player1:sendTextMessage(MESSAGE_STATUS_SMALL, "The arena is already in use.")
			end
		else
			player1:sendTextMessage(MESSAGE_STATUS_SMALL, "You already finished this battle.")
		end
	end
	return true
end