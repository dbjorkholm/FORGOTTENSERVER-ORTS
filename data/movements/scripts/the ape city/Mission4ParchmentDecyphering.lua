function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getStorageValue(Storage.TheApeCity.Mission04) == 1 then
		-- The Ape City Questlog - Mission 4: Parchment Decyphering
		player:setStorageValue(Storage.TheApeCity.Mission04, 2)
		player:say("!-! -O- I_I (/( --I Morgathla", TALKTYPE_MONSTER_SAY)
		position:sendMagicEffect(CONST_ME_MAGIC_RED)
	end
	return true
end


