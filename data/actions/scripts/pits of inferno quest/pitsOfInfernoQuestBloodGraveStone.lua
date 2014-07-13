local config = {
	bloodPos = Position({x = 32791, y = 32333, z = 9}),
	newPos = Position({x = 32791, y = 32332, z = 10})
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local tile = config["bloodPos"]:getTile()
	if tile then
		local thing = tile:getItemById(2016, 2)
		if thing and thing:isItem() then
			thing:remove()
			local player = Player(cid)
			player:getPosition():sendMagicEffect(CONST_ME_DRAWBLOOD)
			player:teleportTo(config["newPos"])
			player:say('Muahaha..', TALKTYPE_MONSTER_SAY)
			player:getPosition():sendMagicEffect(CONST_ME_MORTAREA)
		end
	end
	return true
end
