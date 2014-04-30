local pos = {
	{x = 33258, y = 31079, z = 8},
	{x = 33259, y = 31089, z = 8},
	{x = 33266, y = 31084, z = 8},
	{x = 33263, y = 31093, z = 8}
}


function doClearMissionArea(fromPos, toPos)
	for x = fromPos.x, toPos.x do
		for y = fromPos.y, toPos.y do
			for z = fromPos.z, toPos.z do
				if(getTopCreature({x = x, y = y, z = z}).uid > 0) then
					if(isPlayer(getTopCreature({x = x, y = y, z = z}).uid)) then
                                                if getPlayerStorageValue(creature, 1050) == 19 then
						doTeleportThing(getTopCreature({x = x, y = y, z = z}).uid, {x = 33353, y = 31410, z = 8})
						doSendMagicEffect({x = 33353, y = 31410, z = 8}, CONST_ME_TELEPORT)
			                        setPlayerStorageValue(cid, 15335, 2)
			                        setPlayerStorageValue(cid, 1050, 20)
					else
						doRemoveCreature(getTopCreature({x = x, y = y, z = z}).uid)
					end
				end
                        end
			end
		end
	end
	return true
end

function TirarEscada()
    local escada = getTileItemById({x = 33265, y = 31116, z = 8}, 3687)
    local escada2 = getTileItemById({x = 33265, y = 31116, z = 7}, 3219)
    if escada then
        doRemoveItem(escada.uid, 1)
	doRemoveItem(escada2.uid, 1)
	doCreateItem(11097, 1, {x = 33265, y = 31116, z = 7})
    end
    return true
end


function onStepIn(cid, item, position, lastPosition)
	start = 0
	if item.actionid == 8014 then
		for i = 1, 4 do
			local creature = getTopCreature(pos[i]).uid
			if creature > 0 then
				if isPlayer(creature) then
					if getGlobalStorageValue(8014) < 1 then
						if getPlayerStorageValue(creature, 1050) == 19 then
							start = start + 1
							if creature == cid then
								doCreatureSay(cid, "A clicking sound tatters the silence.", TALKTYPE_ORANGE_1)
							end
						end
					end
				end
			end
		end
		if start == 4 then
			doCreatureSayWithRadius(cid, "The army is complete again. You hear a hatch opening elsewhere, followed by a grinding sound.", TALKTYPE_ORANGE_1, 33261, 31086, {x =  33261, y = 31086, z = 8})
			doCreateItem(3687, 1, {x = 33265, y = 31116, z = 8})
			doCreateItem(3219, 1, {x = 33265, y = 31116, z = 7})
			addEvent(TirarEscada, 30 * 1000)
			setGlobalStorageValue(8014, 1)
			addEvent(setGlobalStorageValue, 8014, 0)
			creature = ""
			for k = 1, 4 do
				for j = 1, 20 do
					if(k < 3) then
						creature = "eternal guardian"
					else
						creature = "lizard chosen"
					end
					summonPos = {x = math.random(33239, 33295), y = math.random(31100, 31132), z = 7}
					addEvent(doSummonCreature, k * 30 * 1000, creature, summonPos)
					addEvent(doSendMagicEffect, k * 30 * 1000, summonPos, CONST_ME_TELEPORT)
				end
			end
			addEvent(doClearMissionArea, 5 * 30 * 1000, {x = 33239, y = 31100, z = 7}, {x = 33295, y = 31132, z = 7})
		end
	end

return true
end
