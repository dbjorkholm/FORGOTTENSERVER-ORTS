local function doResetStateSeal3(itemPos, itemId, itemId2)
        local tile = Position(itemPos):getTile()
        if tile then
                local thing = tile:getItemById(itemId)
                if thing and thing:isItem() then
                        thing:transform(itemId2)
                end
        end
end

local config = {
	[0] = 50015,
	[1] = 50016,
	[2] = 50017,
	[3] = 50018,
	[4] = 50019,
	coalBasins = {
		{x = 32214, y = 31850, z = 15},
		{x = 32215, y = 31850, z = 15},
		{x = 32216, y = 31850, z = 15}
	},
	switchesPos = {
		{x = 32220, y = 31846, z = 15},
		{x = 32220, y = 31845, z = 15},
		{x = 32220, y = 31844, z = 15},
		{x = 32220, y = 31843, z = 15},
		{x = 32220, y = 31842, z = 15}
	},
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return false
	end
	if player:getStorageValue(50018) < 1 and Game.getStorageValue("switchNum") == 5 then
		player:setStorageValue(50018, 1)
		Game.setStorageValue("switchNum", 0)
		player:teleportTo({x = 32271, y = 31857, z = 15}, false)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		for i = 1, #config.coalBasins do
			doResetStateSeal3(config.coalBasins[i], 1484, 1485)
		end
		for i = 1, #config.switchesPos do
			doResetStateSeal3(config.switchesPos[i], 1945, 1946)
		end
	else
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end