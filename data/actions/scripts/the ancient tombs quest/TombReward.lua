local config = {
	[12101] = {storageKey = Storage.TheAncientTombs.Omruc, itemId = 2341, removeId = 2352}, -- Peninsula 	Omruc 	 Crystal Arrow 	 Helmet Adornment
	[12102] = {storageKey = Storage.TheAncientTombs.Thalas, itemId = 2336, removeId = 2351},-- Stone 	Thalas 	 Cobrafang Dagger 	 Gem Holder
	[12103] = {storageKey = Storage.TheAncientTombs.Diphtrah, itemId = 2339, removeId = 2354},-- Mountain 	Dipthrah 	 Ornamented Ankh 	 Damaged Helmet
	[12104] = {storageKey = Storage.TheAncientTombs.Mahrdis, itemId = 2335, removeId = 2353},-- Shadow 	Mahrdis 	 Burning Heart 	 Helmet Ornament
	[12105] = {storageKey = Storage.TheAncientTombs.Vashresamun, itemId = 2338, removeId = 2349},-- Ancient Ruins 	Vashresamun 	 Blue Note 	 Left Horn
	[12106] = {storageKey = Storage.TheAncientTombs.Morguthis, itemId = 2337, removeId = 2350},-- Tarpit 	Morguthis 	 Sword Hilt 	 Right Horn
	[12107] = {storageKey = Storage.TheAncientTombs.Rahemos, itemId = 2340, removeId = 2348}-- Oasis 	Rahemos 	 Ancient Rune 	 Helmet Piece
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local targetItem = config[itemEx.uid]
	if not targetItem then
		return true
	end
		
	local player = Player(cid)
	if player:removeItem(targetItem.removeId, 1) then
		player:setStorageValue(targetItem.storageKey, 1) 
		player:setStorageValue(Storage.TheAncientTombs.DefaultStart, 1) -- default start of The Ancient Tombs Quest
		player:addItem(targetItem.itemId, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found a ' .. ItemType(targetItem.itemId):getName() .. '.')
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You don\'t have the pass item to get this helmet piece.')
	end
	return true
end
