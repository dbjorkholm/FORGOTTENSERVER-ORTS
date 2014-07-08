
function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end

	if item.actionid == 12124 then
		if player:getStorageValue(Storage.TheApeCity.Mission04) == 1 then
			player:setStorageValue(Storage.TheApeCity.Mission04, 2) -- The Ape City Questlog - Mission 4: Parchment Decyphering
			player:say("!-! -O- I_I (/( --I Morgathla", TALKTYPE_ORANGE_1)
			position:sendMagicEffect(CONST_ME_MAGIC_RED)
		end
	end
	return true
end


