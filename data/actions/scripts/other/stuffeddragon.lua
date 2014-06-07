local commonSounds = {
	'Fchhhhhh!',
	'Zchhhhhh!',
}
local explosionSounds = {
	['normal'] = 'Aaa... CHOO!',
	['rare'] = 'Groaaarrr.... *cough*',
	['veryRare'] = 'You... will.... burn!!'
}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	local item = Item(uid)
	if player:getStorageValue(530) >= 5 then
		rareCount = math.random(1,6)
		if rareCount == 6 then
			player:say(explosionSounds['veryRare'], TALKTYPE_ORANGE_1, isInGhostMode, 0, fromPosition)
			player:getPosition():sendMagicEffect(CONST_ME_FIREAREA)
			player:addHealth(-1)
		elseif rareCount == 5 or rareCount == 4 then
			player:say(explosionSounds['rare'], TALKTYPE_ORANGE_1, isInGhostMode, 0, fromPosition)
			fromPosition:sendMagicEffect(CONST_ME_POFF)
		else
			player:say(explosionSounds['normal'], TALKTYPE_ORANGE_1, isInGhostMode, 0, fromPosition)
			fromPosition:sendMagicEffect(CONST_ME_EXPLOSIONHIT)
		end
		player:setStorageValue(530, nil)
	else
		player:say(commonSounds[ math.random( #commonSounds ) ], TALKTYPE_ORANGE_1, isInGhostMode, 0, fromPosition)
		player:setStorageValue(530, math.max(1, player:getStorageValue(530) +1))
	end
	return true
end
