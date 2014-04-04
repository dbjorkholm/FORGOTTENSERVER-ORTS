local newPos = {x = 2000, y = 2000, z = 6}
local bloodPos = {x = 1991, y = 2010, z = 7}
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