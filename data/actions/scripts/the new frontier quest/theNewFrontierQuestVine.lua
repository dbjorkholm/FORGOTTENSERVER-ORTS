function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)	
	if item.uid == 3154 then
		local destination = Position({x = 33020, y = 31536, z = 4})
		player:teleportTo(destination)
		destination:sendMagicEffect( CONST_ME_POFF)
	elseif item.uid == 3153 then
		local destination = Position({x = 33022, y = 31536, z = 6})
		player:teleportTo(destination)
		destination:sendMagicEffect( CONST_ME_POFF)
	end
	return true
end

