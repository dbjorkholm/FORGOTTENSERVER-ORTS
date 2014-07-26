local spores = {
	[18328] = 18221,
	[18329] = 18222,
	[18330] = 18223,
	[18331] = 18224,
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if spores[item.itemid] then
		local spore = math.random(18221, 18224)
		Game.createItem(spore, 1, Position(toPosition.x, toPosition.y, toPosition.z, toPosition.stackpos + 1))
		addEvent(Tile(toPosition):getItemById(spore):remove(), 40 * 1000, 1)
		toPosition:sendMagicEffect(CONST_ME_POFF)
	elseif spores[item.itemid] and itemEx.itemid == spores[item.itemid] then
		if player:getStorageValue(949) < 4 and player:getStorageValue(948) == 1 then
			player:setStorageValue(949, player:getStorageValue(949) + 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have gathered the correct spores.")
			Item(item.uid):transform(item.itemid + 1)
			toPosition:sendMagicEffect(CONST_ME_POFF)
		end
	elseif spores[item.itemid] and itemEx.itemid ~= spores[item.itemid] then
		if player:getStorageValue(949) < 4 and player:getStorageValue(948) == 1 then
			player:setStorageValue(949, 0)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have gathered the wrong spores.You ruined your collection.")
			Item(item.uid):transform(18328)
			toPosition:sendMagicEffect(CONST_ME_POFF)
		end
	end
	return true
end