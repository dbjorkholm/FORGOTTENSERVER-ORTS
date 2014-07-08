local function doCheckPearls(pearlPos, itemid)
	local Tile = Position(pearlPos):getTile()
	if Tile then
		local thing = Tile:getItemById(itemid)
		if thing and thing:isItem() then
			thing:remove()
			Position(pearlPos):sendMagicEffect(CONST_ME_MAGIC_RED)
			return true
		else
			return false
		end
	end
end

local config = {
	[1] = {pos = {x = 32173, y = 31871, z = 15}, pId = 2143},
	[2] = {pos = {x = 32180, y = 31871, z = 15}, pId = 2144}
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	local pearls = 0
	if not player then
		return false
	end
	if player:getStorageValue(50019) < 1 then	
		for i = 1, 2 do
			if doCheckPearls(config[i].pos, config[i].pId) then
				pearls = pearls + 1
			end
		end
		if pearls == 2 then
			player:teleportTo({x = player:getPosition().x, y = player:getPosition().y-6, z = 15}, false)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		else
			player:teleportTo(fromPosition, true)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		end		
	else
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end