local boss = {
	["fury of the emperor"] = {pos = Position({x = 33049, y = 31089, z = 15}), storage = 3189},
	["wrath of the emperor"] = {pos = Position({x = 33095, y = 31090, z = 15}), storage = 3190},
	["scorn of the emperor"] = {pos = Position({x = 33095, y = 31114, z = 15}), storage = 3191},
	["spite of the emperor"] = {pos = Position({x = 33049, y = 31115, z = 15}), storage = 3192},
}

function onKill(cid, target)
	local monster = Monster(target)
	bossTmp = boss[string.lower(monster:getName())]
	if monster then
		if bossTmp then
			Game.setStorageValue(bossTmp.storage, 0)
			local tile = bossTmp.pos:getTile()
			if tile then
				local thing = tile:getItemById(11753)
				if thing and thing:isItem() then
					thing:transform(12383)
				end
			end
		end
	end
	return true
end