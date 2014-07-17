local config = {
	level = 30,
	portals = {
	-- uniqueid, teleportToPos, vocations
	--Carlin
		[9069] = { Position(32192, 31419, 2), { 2, 6 }, 10017 }, --ice
		[9070] = { Position(32972, 32227, 7), { 2, 6 }, 10017}, --earth
		[9071] = { Position(32911, 32336, 15), { 1, 5 }, 10017}, --fire
		[9072] = { Position(33059, 32716, 5), { 1, 5 }, 10017}, --electric
	--End
	--Thais
		[9073] = { Position(32192, 31419, 2), { 2, 6 }, 10018 }, --ice
		[9074] = { Position(32972, 32227, 7), { 2, 6 }, 10018}, --earth
		[9075] = { Position(32911, 32336, 15), { 1, 5 }, 10018}, --fire
		[9076] = { Position(33059, 32716, 5), { 1, 5 }, 10018}, --electric
	--End
	--Venore
		[9077] = { Position(32192, 31419, 2), { 2, 6 }, 10019 }, --ice
		[9078] = { Position(32972, 32227, 7), { 2, 6 }, 10019}, --earth
		[9079] = { Position(32911, 32336, 15), { 1, 5 }, 10019}, --fire
		[9080] = { Position(33059, 32716, 5), { 1, 5 }, 10019}, --electric
	--End
	--AB
		[9081] = { Position(32192, 31419, 2), { 2, 6 }, 10020 }, --ice
		[9082] = { Position(32972, 32227, 7), { 2, 6 }, 10020}, --earth
		[9083] = { Position(32911, 32336, 15), { 1, 5 }, 10020}, --fire
		[9084] = { Position(33059, 32716, 5), { 1, 5 }, 10020}, --electric
	--End
	--Kazodron
		[9085] = { Position(32192, 31419, 2), { 2, 6 }, 10021 }, --ice
		[9086] = { Position(32972, 32227, 7), { 2, 6 }, 10021}, --earth
		[9087] = { Position(32911, 32336, 15), { 1, 5 }, 10021}, --fire
		[9088] = { Position(33059, 32716, 5), { 1, 5 }, 10021}, --electric
	--End
	--Darashia
		[9089] = { Position(32192, 31419, 2), { 2, 6 }, 10022}, --ice
		[9090] = { Position(32972, 32227, 7), { 2, 6 }, 10022}, --earth
		[9091] = { Position(32911, 32336, 15), { 1, 5 }, 10022}, --fire
		[9092] = { Position(33059, 32716, 5), { 1, 5 }, 10022}, --electric
	--End
	--Ankra
		[9093] = { Position(32192, 31419, 2), { 2, 6 }, 10023}, --ice
		[9094] = { Position(32972, 32227, 7), { 2, 6 }, 10023}, --earth
		[9095] = { Position(32911, 32336, 15), { 1, 5 }, 10023}, --fire
		[9096] = { Position(33059, 32716, 5), { 1, 5 }, 10023}, --electric
	--End
	--Edron
		[9097] = { Position(32192, 31419, 2), { 2, 6 }, 10024}, --ice
		[9098] = { Position(32972, 32227, 7), { 2, 6 }, 10024}, --earth
		[9099] = { Position(32911, 32336, 15), { 1, 5 }, 10024}, --fire
		[9100] = { Position(33059, 32716, 5), { 1, 5 }, 10024}, --electric
	--End	
	--Liberty Bay
		[9101] = { Position(32192, 31419, 2), { 2, 6 }, 10025}, --ice
		[9102] = { Position(32972, 32227, 7), { 2, 6 }, 10025}, --earth
		[9103] = { Position(32911, 32336, 15), { 1, 5 }, 10025}, --fire
		[9104] = { Position(33059, 32716, 5), { 1, 5 }, 10025}, --electric
	--End
	--Port Hope
		[9105] = { Position(32192, 31419, 2), { 2, 6 }, 10026}, --ice
		[9106] = { Position(32972, 32227, 7), { 2, 6 }, 10026}, --earth
		[9107] = { Position(32911, 32336, 15), { 1, 5 }, 10026}, --fire
		[9108] = { Position(33059, 32716, 5), { 1, 5 }, 10026}, --electric
	--End
	--Svargrond
		[9109] = { Position(32192, 31419, 2), { 2, 6 }, 10027}, --ice
		[9110] = { Position(32972, 32227, 7), { 2, 6 }, 10027}, --earth
		[9111] = { Position(32911, 32336, 15), { 1, 5 }, 10027}, --fire
		[9112] = { Position(33059, 32716, 5), { 1, 5 }, 10027}, --electric
	--End
	--Yalahari
		[9113] = { Position(32192, 31419, 2), { 2, 6 }, 10028}, --ice
		[9114] = { Position(32972, 32227, 7), { 2, 6 }, 10028}, --earth
		[9115] = { Position(32911, 32336, 15), { 1, 5 }, 10028}, --fire
		[9116] = { Position(33059, 32716, 5), { 1, 5 }, 10028} --electric
	--End					
	}
}

function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	if not player then
		return true
	end
	
	local tile = config.portals[item.uid]
	if tile and isInArray(i[2], player:getVocation()) and player:getLevel() >= config.level then
		player:teleportTo(tile[1])
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:setStorageValue(tile[3], 1)
	else
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say(not tile and "" or "Only " .. (config.premium and "Premium " or "") .. (tile[2][1] == 1 and "Sorcerers" or "Druids") .. (config.level and " of level " .. config.level .. " or higher" or "") .. " may enter this portal", TALKTYPE_MONSTER_SAY, false, cid)
	end
	return true
end

