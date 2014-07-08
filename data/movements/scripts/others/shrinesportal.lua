local cfg = {
	level = 30,
	portals = {
	-- uniqueid, teleportToPos, vocations
	--Carlin
		[9069] = { {x=32192, y=31419, z=2}, { 2, 6 }, 10017 }, --ice
		[9070] = { {x=32972, y=32227, z=7}, { 2, 6 }, 10017}, --earth
		[9071] = { {x=32911, y=32336, z=15}, { 1, 5 }, 10017}, --fire
		[9072] = { {x=33059, y=32716, z=5}, { 1, 5 }, 10017}, --electric
	--End
	--Thais
		[9073] = { {x=32192, y=31419, z=2}, { 2, 6 }, 10018 }, --ice
		[9074] = { {x=32972, y=32227, z=7}, { 2, 6 }, 10018}, --earth
		[9075] = { {x=32911, y=32336, z=15}, { 1, 5 }, 10018}, --fire
		[9076] = { {x=33059, y=32716, z=5}, { 1, 5 }, 10018}, --electric
	--End
	--Venore
		[9077] = { {x=32192, y=31419, z=2}, { 2, 6 }, 10019 }, --ice
		[9078] = { {x=32972, y=32227, z=7}, { 2, 6 }, 10019}, --earth
		[9079] = { {x=32911, y=32336, z=15}, { 1, 5 }, 10019}, --fire
		[9080] = { {x=33059, y=32716, z=5}, { 1, 5 }, 10019}, --electric
	--End
	--AB
		[9081] = { {x=32192, y=31419, z=2}, { 2, 6 }, 10020 }, --ice
		[9082] = { {x=32972, y=32227, z=7}, { 2, 6 }, 10020}, --earth
		[9083] = { {x=32911, y=32336, z=15}, { 1, 5 }, 10020}, --fire
		[9084] = { {x=33059, y=32716, z=5}, { 1, 5 }, 10020}, --electric
	--End
	--Kazodron
		[9085] = { {x=32192, y=31419, z=2}, { 2, 6 }, 10021 }, --ice
		[9086] = { {x=32972, y=32227, z=7}, { 2, 6 }, 10021}, --earth
		[9087] = { {x=32911, y=32336, z=15}, { 1, 5 }, 10021}, --fire
		[9088] = { {x=33059, y=32716, z=5}, { 1, 5 }, 10021}, --electric
	--End
	--Darashia
		[9089] = { {x=32192, y=31419, z=2}, { 2, 6 }, 10022}, --ice
		[9090] = { {x=32972, y=32227, z=7}, { 2, 6 }, 10022}, --earth
		[9091] = { {x=32911, y=32336, z=15}, { 1, 5 }, 10022}, --fire
		[9092] = { {x=33059, y=32716, z=5}, { 1, 5 }, 10022}, --electric
	--End
	--Ankra
		[9093] = { {x=32192, y=31419, z=2}, { 2, 6 }, 10023}, --ice
		[9094] = { {x=32972, y=32227, z=7}, { 2, 6 }, 10023}, --earth
		[9095] = { {x=32911, y=32336, z=15}, { 1, 5 }, 10023}, --fire
		[9096] = { {x=33059, y=32716, z=5}, { 1, 5 }, 10023}, --electric
	--End
	--Edron
		[9097] = { {x=32192, y=31419, z=2}, { 2, 6 }, 10024}, --ice
		[9098] = { {x=32972, y=32227, z=7}, { 2, 6 }, 10024}, --earth
		[9099] = { {x=32911, y=32336, z=15}, { 1, 5 }, 10024}, --fire
		[9100] = { {x=33059, y=32716, z=5}, { 1, 5 }, 10024}, --electric
	--End	
	--Liberty Bay
		[9101] = { {x=32192, y=31419, z=2}, { 2, 6 }, 10025}, --ice
		[9102] = { {x=32972, y=32227, z=7}, { 2, 6 }, 10025}, --earth
		[9103] = { {x=32911, y=32336, z=15}, { 1, 5 }, 10025}, --fire
		[9104] = { {x=33059, y=32716, z=5}, { 1, 5 }, 10025}, --electric
	--End
	--Port Hope
		[9105] = { {x=32192, y=31419, z=2}, { 2, 6 }, 10026}, --ice
		[9106] = { {x=32972, y=32227, z=7}, { 2, 6 }, 10026}, --earth
		[9107] = { {x=32911, y=32336, z=15}, { 1, 5 }, 10026}, --fire
		[9108] = { {x=33059, y=32716, z=5}, { 1, 5 }, 10026}, --electric
	--End
	--Svargrond
		[9109] = { {x=32192, y=31419, z=2}, { 2, 6 }, 10027}, --ice
		[9110] = { {x=32972, y=32227, z=7}, { 2, 6 }, 10027}, --earth
		[9111] = { {x=32911, y=32336, z=15}, { 1, 5 }, 10027}, --fire
		[9112] = { {x=33059, y=32716, z=5}, { 1, 5 }, 10027}, --electric
	--End
	--Yalahari
		[9113] = { {x=32192, y=31419, z=2}, { 2, 6 }, 10028}, --ice
		[9114] = { {x=32972, y=32227, z=7}, { 2, 6 }, 10028}, --earth
		[9115] = { {x=32911, y=32336, z=15}, { 1, 5 }, 10028}, --fire
		[9116] = { {x=33059, y=32716, z=5}, { 1, 5 }, 10028} --electric
	--End					
	}
}

function onStepIn(cid, item, position, fromPosition)
	if (isPlayer(cid)) then
		local i = cfg.portals[item.uid]
		if (i and isInArray(i[2], getPlayerVocation(cid)) and getPlayerLevel(cid) >= cfg.level) then
			doTeleportThing(cid, i[1])
			doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
			setPlayerStorageValue(cid, i[3], 1)
		else
			doTeleportThing(cid, fromPosition, true)
			doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
			doCreatureSay(cid, not i and "" or "Only " .. (cfg.premium and "Premium " or "") .. (i[2][1] == 1 and "Sorcerers" or "Druids") .. (cfg.level and " of level " .. cfg.level .. " or higher" or "") .. " may enter this portal", TALKTYPE_ORANGE_1, false, cid)
		end
	end
	return true
end