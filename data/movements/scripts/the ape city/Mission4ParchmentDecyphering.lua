function onStepIn(cid, item, position, lastPosition)
local player = Player(cid)
	if item.actionid == 12124 then
		if player:getStorageValue(12124) == 1 then
			player:setStorageValue(12124, 2) -- The Ape City Questlog - Mission 4: Parchment Decyphering
			player:say("!-! -O- I_I (/( --I Morgathla", TALKTYPE_ORANGE_1)
			position:sendMagicEffect(CONST_ME_MAGIC_RED)
		end
	end
	return true
end


