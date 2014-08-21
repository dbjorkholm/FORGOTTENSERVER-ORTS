local function revertCrystal(position, itemId, transformId)
	local item = Tile(position):getItemById(itemId)
	if item then
		item:transform(transformId)
	end
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid ~= 18321 then
		return false
	end

	local player = Player(cid)
	if player:getStorageValue(943) == 1 or player:getStorageValue(942) ~= 1 then
		return false
	end

	Item(itemEx.uid):transform(18320)
	addEvent(revertCrystal, 40000, toPosition, 18320, 18321)

	if math.random(5) ~= 5 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'This is not the crystal you\'re looking for!')
		return true
	end

	player:setStorageValue(943, 1)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Congratulations! The crystals seem to have fallen in love and your mission is done!')
	return true
end
