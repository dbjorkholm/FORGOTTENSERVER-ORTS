local config = {
	[12101] = {12101, 2341, "Helmet Adornment"}, -- Peninsula 	Omruc 	 Crystal Arrow 	 Helmet Adornment
	[12102] = {12102, 2336, "Gem Holder"},-- Stone 	Thalas 	 Cobrafang Dagger 	 Gem Holder
	[12103] = {12103, 2339, "Damaged Helmet"},-- Mountain 	Dipthrah 	 Ornamented Ankh 	 Damaged Helmet
	[12104] = {12104, 2335, "Helmet Ornament"},-- Shadow 	Mahrdis 	 Burning Heart 	 Helmet Ornament
	[12105] = {12105, 2338, "Left Horn"},-- Ancient Ruins 	Vashresamun 	 Blue Note 	 Left Horn
	[12106] = {12106, 2337, "Right Horn"},-- Tarpit 	Morguthis 	 Sword Hilt 	 Right Horn
	[12107] = {12107, 2340, "Helmet Piece"}-- Oasis 	Rahemos 	 Ancient Rune 	 Helmet Piece
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	local targetItem = config[itemEx.uid]
	if not targetItem then
		return true
	end
		
	if player:getStorageValue(targetItem[1]) < 1 then
		player:setStorageValue(targetItem[1], 1) 
		player:setStorageValue(12100, 1) -- default start of The Ancient Tombs Quest
		player:addItem(targetItem[2], 1)
		player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("You've found a %s.", targetItem[3]))
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "The chest is empty.")
	end
	return true
end
