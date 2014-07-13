function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.actionid == 8013 then
		local player = Player(cid)
		if player:getStorageValue(Storage.ChildrenoftheRevolution.Questline) == 14 then
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
			pos2 = {
				{x = 33352, y = 31126, z = 5, stackpos = STACKPOS_GROUND},
				{x = 33353, y = 31126, z = 5, stackpos = STACKPOS_GROUND},
				{x = 33354, y = 31126, z = 5, stackpos = STACKPOS_GROUND},
				{x = 33355, y = 31126, z = 5, stackpos = STACKPOS_GROUND}
			}
			for i = 1, 4 do
				tmp[i] = getThingfromPos(pos[i]).itemid
			end
			for i = 1, 4 do
				Item(getThingfromPos(pos2[i]).uid):transform(tmp[leverChange[lever][i]])
				Position(pos2[i]):sendMagicEffect(CONST_ME_POFF)
			end
			pass = 0
			configuration = {
				10856,
				10853,
				10855,
				10850
			}
			for i = 1, 4 do
				if(getThingfromPos(pos2[i]).itemid == configuration[i]) then
					pass = pass + 1
				end
			end
			if(pass == 4) then
				player:setStorageValue(Storage.ChildrenoftheRevolution.Questline, 17)
				player:setStorageValue(Storage.ChildrenoftheRevolution.Mission04, 5) --Questlog, Children of the Revolution "Mission 4: Zze Way of Zztonezz"
				player:say("After a cracking noise a deep humming suddenly starts from somewhere below.", TALKTYPE_MONSTER_SAY)
			end
			doTransformItem(itemEx.uid, itemEx.itemid == 10044 and 10045 or 10044, 1)
		else
			player:say("The lever does not budge.", TALKTYPE_MONSTER_SAY)
		end
	end
	return true
end