function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 10760 and itemEx.actionid == 8013) then
		if(getPlayerStorageValue(cid, 1050) == 16) then
			lever = toPosition.y - 31122
			leverChange = {
				[1] = {1, 3, 2, 4},
				[2] = {2, 1, 3, 4},
				[3] = {2, 3, 1, 4},
				[4] = {3, 2, 4, 1},
				[5] = {4, 2, 1, 3}
			}
			tmp = {}
			pos = {
				{x = 33355, y = 31126, z = 7, stackpos = STACKPOS_GROUND},
				{x = 33356, y = 31126, z = 7, stackpos = STACKPOS_GROUND},
				{x = 33357, y = 31126, z = 7, stackpos = STACKPOS_GROUND},
				{x = 33358, y = 31126, z = 7, stackpos = STACKPOS_GROUND}
			}
			for i = 1, 4 do
				tmp[1] = getThingfromPos(pos[i]).itemid
			end
			for i = 1, 4 do
				doTransformItem(getThingfromPos(pos[i]).uid, tmp[leverChange[lever][i]])
				doSendMagicEffect(pos[i], CONST_ME_POFF)
			end
			pass = 0
			configuration = {
				10850,
				10853,
				10856,
				10855
			}
			for i = 1, 4 do
				if(getThingfromPos(pos[i]).itemid == configuration[i]) then
					pass = pass + 1
				end
			end
			if(pass == 4) then
				setPlayerStorageValue(cid, 1050, 17)
				doCreatureSay(cid, "You found the right combination. You should report to Zalamon.", TALKTYPE_ORANGE_1)
			end
			doTransformItem(itemEx.uid, itemEx.itemid == 10044 and 10045 or 10044, 1)
		end
	end
	return true
end