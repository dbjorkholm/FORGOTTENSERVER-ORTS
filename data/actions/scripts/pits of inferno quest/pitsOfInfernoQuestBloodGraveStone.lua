local newPos = {x = 32791, y = 32332, z = 10}
local bloodPos = {x = 32791, y = 32334, z = 9}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	local blood = pushThing(Tile(bloodPos):getItemById(2016))
	if blood.uid > 0 and blood.type == 2 then
		Item(blood.uid):remove()
		player:getPosition():sendMagicEffect(CONST_ME_DRAWBLOOD)
		player:teleportTo(newPos)
		player:say('Muahaha..',TALKTYPE_ORANGE_1)
		player:getPosition():sendMagicEffect(CONST_ME_MORTAREA)
	end
	return true
end