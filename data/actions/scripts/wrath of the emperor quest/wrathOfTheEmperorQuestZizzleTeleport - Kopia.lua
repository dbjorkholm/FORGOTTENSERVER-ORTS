function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3184) then
		if(getPlayerStorageValue(cid, Storage.WrathoftheEmperor.Questline) == 27) then
			if(getPlayerPosition(cid).x == 33078 and 
				getPlayerPosition(cid).y == 31080 and 
				getPlayerPosition(cid).z == 13) then
				doTeleportThing(cid, {x = 33077, y = 31186, z = 3})
				doSendMagicEffect({x = 33077, y = 31186, z = 3}, CONST_ME_TELEPORT)
			end
		end
	elseif(item.uid == 3185) then
		if(getPlayerStorageValue(cid, Storage.WrathoftheEmperor.Questline) == 27) then
			if(getPlayerPosition(cid).x == 33077 and 
				getPlayerPosition(cid).y == 31186 and 
				getPlayerPosition(cid).z == 3) then
				doTeleportThing(cid, {x = 33077, y = 31080, z = 13})
				doSendMagicEffect({x = 33077, y = 31080, z = 13}, CONST_ME_TELEPORT)
			end
		end
	end
	return true
end