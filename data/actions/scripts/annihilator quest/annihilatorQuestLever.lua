local config = {
	requiredLevel = 100,
	daily = false,
	centerDemonRoomPosition = Position(33221, 31659, 13),
	playerPositions = {
		Position(33225, 31671, 13),
		Position(33224, 31671, 13),
		Position(33223, 31671, 13),
		Position(33222, 31671, 13)
	},
	newPositions = {
		Position(33222, 31659, 13),
		Position(33221, 31659, 13),
		Position(33220, 31659, 13),
		Position(33219, 31659, 13)
	},
	demonPositions = {
		Position(33219, 31657, 13),
		Position(33221, 31657, 13),
		Position(33223, 31659, 13),
		Position(33224, 31659, 13),
		Position(33220, 31661, 13),
		Position(33222, 31661, 13)
	}
}
	

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local lever = Item(item.uid)
	local player = Player(cid)
	if item.itemid == 1946 then
		local players = {}
		local continue = true
		for _, positions in ipairs(config.playerPositions) do
			local playerTile = Tile(positions):getTopCreature()
			if not playerTile or not playerTile:isPlayer() or playerTile:getLevel() < config.requiredLevel then
				return false
			end
			players[#players+1] = playerTile
		end

		local specs = Game.getSpectators(config.centerDemonRoomPosition, false, false, 3, 3, 2, 2)
		for i = 1, #specs do
			if specs[i]:isPlayer() then
				player:sendTextMessage(MESSAGE_STATUS_SMALL, "A team is already inside the quest room.")
				continue = false
				break
			end
			if specs[i]:isMonster() then
				specs[i]:remove()
			end
		end

		if not continue then
			return true
		end

		for i = 1, #config.demonPositions do
			Game.createMonster("Demon", config.demonPositions[i])
		end

		for i, tablePlayer in ipairs(players) do
			Position(config.playerPositions[i]):sendMagicEffect(CONST_ME_POFF)
			tablePlayer:teleportTo(config.newPositions[i])
			tablePlayer:getPosition():sendMagicEffect(CONST_ME_ENERGYAREA)
			tablePlayer:setDirection(EAST)
		end
		lever:transform(item.itemid - 1)
	elseif item.itemid == 1945 then
		if config.daily then
			player:sendTextMessage(MESSAGE_STATUS_SMALL, Game.getReturnMessage(RETURNVALUE_NOTPOSSIBLE))
		else
			lever:transform(item.itemid + 1)
		end
	end
	return true
end