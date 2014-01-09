function onStepIn(cid, item, position, lastPosition)
	if(item.uid == 3111) then
		if(getPlayerStorageValue(cid, 121) == 30) then
			setPlayerStorageValue(cid, 121, 31)
			doCreatureSay(cid, "You discovered the necromantic altar and should report about it.", TALKTYPE_ORANGE_1)
			for x = -1, 1 do
				for y = 1, 1 do
					if(y ~= 0 and x ~= 0) then
						doSendMagicEffect({x = position.x + x, y = position.y + y, z = position.z}, CONST_ME_DEATH)
					end
				end
			end
		end
	end
	return true
end
