local destination = {
	[4121] = {position = Position(32801, 31766, 9), storageValue = 1, needCrystal = true},
	[3220] = {position = Position(32627, 31863, 11), storageValue = 1, needCrystal = true},
	[3128] = {position = Position(33000, 31870, 13), storageValue = 16}, -- Crystal Grounds (Entrada)
	[3129] = {position = Position(32795, 31762, 10), storageValue = 16}, -- Crystal Grounds (Salida)
	[3130] = {position = Position(32864, 31844, 11), storageValue = 17}, -- Truffels Garden (Entrada)
	[3131] = {position = Position(32803, 31746, 10), storageValue = 17}, -- Truffels Garden (Salida)
	[3132] = {position = Position(32986, 31862, 9), storageValue = 18}, -- Gnomebase Alpha (Entrada)
	[3133] = {position = Position(32796, 31781, 10), storageValue = 18}, -- Gnomebase Alpha (Salida)
	[3134] = {position = Position(32959, 31953, 9), storageValue = 18}, -- Golems Workshop (Entrada)
	[3135] = {position = Position(33001, 31915, 9), storageValue = 18}, -- Golems Workshop (Salida)
	[3136] = {position = Position(32904, 31894, 13), storageValue = 19}, -- Golem (Entrada)
	[3137] = {position = Position(32979, 31907, 9), storageValue = 19}, -- Golem (Salida)
	[35669] = {position = Position(32986, 31864, 9), storageValue = 1}, -- leave warzone 3
	[3215] = {position = Position(32369, 32241, 7), storageValue = 1, needCrystal = true}, -- Thais
	[3216] = {position = Position(32212, 31133, 7), storageValue = 1, needCrystal = true}, -- Svargrond
	[3217] = {position = Position(32317, 32825, 7), storageValue = 1, needCrystal = true}, -- Liberty Bay
	[3218] = {position = Position(33213, 32454, 1), storageValue = 1, needCrystal = true}, -- Darashia
	[3219] = {position = Position(33217, 31814, 8), storageValue = 1, needCrystal = true}  -- Edron
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	local teleportCrystal = destination[item.actionid]
	if not teleportCrystal then
		return
	end

	if player:getStorageValue(Storage.BigfootBurden.QuestLine) >= teleportCrystal.storageValue then
		if not teleportCrystal.needCrystal or player:removeItem(18457, 1) then
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(teleportCrystal.position)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		else
			player:teleportTo(fromPosition)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You need a teleport crystal to use this device.')
		end
		return true
	end

	-- There is no destination with storageValue == 2, should this check for storage?
	if teleportCrystal.storageValue == 2 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have no idea on how to use this device. Xelvar in Kazordoon might tell you more about it.')
	else
		player:teleportTo(fromPosition)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Sorry, you don\'t have access to use this teleport!')
	end
	return true
end
