local config = {
	[12101] = {12101, 2341, 2352, "Helmet Adornment"}, -- Peninsula 	Omruc 	 Crystal Arrow 	 Helmet Adornment
	[12102] = {12102, 2336, 2351, "Gem Holder"},-- Stone 	Thalas 	 Cobrafang Dagger 	 Gem Holder
	[12103] = {12103, 2339, 2354, "Damaged Helmet"},-- Mountain 	Dipthrah 	 Ornamented Ankh 	 Damaged Helmet
	[12104] = {12104, 2335, 2353, "Helmet Ornament"},-- Shadow 	Mahrdis 	 Burning Heart 	 Helmet Ornament
	[12105] = {12105, 2338, 2349, "Left Horn"},-- Ancient Ruins 	Vashresamun 	 Blue Note 	 Left Horn
	[12106] = {12106, 2337, 2350, "Right Horn"},-- Tarpit 	Morguthis 	 Sword Hilt 	 Right Horn
	[12107] = {12107, 2340, 2348, "Helmet Piece"}-- Oasis 	Rahemos 	 Ancient Rune 	 Helmet Piece
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local targetItem = config[itemEx.uid]
	if not targetItem then
		return true
	end
		
	local player = Player(cid)
	if player:removeItem(targetItem[3], 1) then
		player:setStorageValue(targetItem[1], 1) 
		player:setStorageValue(12100, 1) -- default start of The Ancient Tombs Quest
		player:addItem(targetItem[2], 1)
		player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("You've found a %s.", targetItem[4]))
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You don't have the pass item to get this helmet piece.")
	end
	return true
end
